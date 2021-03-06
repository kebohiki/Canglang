%%%-------------------------------------------------------------------
%%% @author hxming
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 七月 2017 16:55
%%%-------------------------------------------------------------------
-module(golden_body).
-author("hxming").


-include("golden_body.hrl").
-include("server.hrl").
-include("common.hrl").
-include("daily.hrl").
-include("goods.hrl").
-include("tips.hrl").
-include("activity.hrl").
-include("achieve.hrl").

%% API
-export([
    get_golden_body_info/0,
    view_other/1,
    change_figure/2,
    upgrade_stage/2,
    bless_cd_reset/2,
    check_bless_state/1,
    mail_bless_reset/2,
    equip_goods/2,
    use_golden_body_dan/1,
    check_upgrade_stage_state/2,
    check_use_golden_body_dan_state/2,
    check_upgrade_jp_state/3,
    goods_add_stage/3,
    goods_add_to_stage/3,
    goods_add_stage_limit/3,
    get_equip_smelt_state/0,
    log_golden_body_stage/7
]).

%%获取信息
get_golden_body_info() ->
    GoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),
    Now = util:unixtime(),
    Cd = max(0, GoldenBody#st_golden_body.bless_cd - Now),
    SkillList =
        golden_body_skill:get_golden_body_skill_list(GoldenBody#st_golden_body.skill_list),
    AttributeList = attribute_util:pack_attr(GoldenBody#st_golden_body.attribute),
    EquipList = [[SubType, EquipId] || {SubType, EquipId, _} <- GoldenBody#st_golden_body.equip_list],
    SpiritState = golden_body_spirit:check_spirit_state(GoldenBody),
    {GoldenBody#st_golden_body.stage, GoldenBody#st_golden_body.exp, Cd, GoldenBody#st_golden_body.golden_body_id,
        GoldenBody#st_golden_body.cbp, GoldenBody#st_golden_body.grow_num, AttributeList, SkillList, EquipList, SpiritState}.

view_other(Pkey) ->
    Key = {golden_body_view, Pkey},
    case cache:get(Key) of
        [] ->
            case golden_body_load:load_view(Pkey) of
                [] -> {0, 0, [], [], [], 0, []};
                %%stage,cbp,attribute,skill_list,equip_list,grow_num,spirit_list
                [Stage, Cbp, AttributeList, SkillList, EquipList, GrowNum] ->
                    NewAttributeList = attribute_util:pack_attr(util:bitstring_to_term(AttributeList)),
                    NewSkillList = golden_body_skill:get_golden_body_skill_list(util:bitstring_to_term(SkillList)),
                    NewEquipList = [[SubType, EquipId] || {SubType, EquipId, _} <- util:bitstring_to_term(EquipList)],
                    DanList = goods_attr_dan:get_dan_list_by_type(Pkey, ?GOODS_DAN_TYPE_GOLDEN_BODY),
                    Data = {Stage, Cbp, NewAttributeList, NewSkillList, NewEquipList, GrowNum, DanList},
                    cache:set(Key, Data, ?FIFTEEN_MIN_SECONDS),
                    Data
            end;
        Data -> Data
    end.

%%%%幻化
change_figure(Player, FigureId) ->
    StGoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),
    case data_golden_body_stage:figure2stage(FigureId) of
        [] -> {8, Player};
        Stage ->
            if StGoldenBody#st_golden_body.stage < Stage -> {9, Player};
                true ->
                    NewStGoldenBody = StGoldenBody#st_golden_body{golden_body_id = FigureId, is_change = 1},
                    lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewStGoldenBody),
                    {1, Player#player{golden_body_id = FigureId}}
            end
    end.

%%物品增加1阶
goods_add_stage(Player, [], GoodsList) -> {Player, GoodsList};
goods_add_stage(Player, [{Stage, Exp} | T], GoodsList) ->
    GoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),
    MaxStage = data_golden_body_stage:max_stage(),
    if GoldenBody#st_golden_body.stage >= MaxStage -> {Player, GoodsList};
        GoldenBody#st_golden_body.stage >= Stage ->
            BaseData = data_golden_body_stage:get(GoldenBody#st_golden_body.stage),
            NewExp = GoldenBody#st_golden_body.exp + Exp,
            if NewExp >= BaseData#base_golden_body_stage.exp ->
                NextBaseData = data_golden_body_stage:get(GoldenBody#st_golden_body.stage + 1),
                NewGoldenBody = GoldenBody#st_golden_body{exp = 0, stage = GoldenBody#st_golden_body.stage + 1, bless_cd = 0, golden_body_id = NextBaseData#base_golden_body_stage.golden_body_id, is_change = 1},
                NewGoldenBody1 = golden_body_init:calc_attribute(NewGoldenBody),
                lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody1),
                NewPlayer = player_util:count_player_attribute(Player#player{golden_body_id = NewGoldenBody1#st_golden_body.golden_body_id}, true),
                scene_agent_dispatch:golden_body_update(NewPlayer),
                log_golden_body_stage(Player#player.key, Player#player.nickname, NewGoldenBody#st_golden_body.stage, GoldenBody#st_golden_body.stage, NewGoldenBody#st_golden_body.exp, GoldenBody#st_golden_body.exp, 0),
                achieve:trigger_achieve(Player, ?ACHIEVE_TYPE_1, ?ACHIEVE_SUBTYPE_1034, 0, NewGoldenBody#st_golden_body.stage),
                goods_add_stage(NewPlayer, T, GoodsList ++ tuple_to_list(BaseData#base_golden_body_stage.award));
                true ->
                    GoldenBody1 = set_bless_cd(GoldenBody, BaseData#base_golden_body_stage.cd),
                    NewGoldenBody = GoldenBody1#st_golden_body{exp = GoldenBody#st_golden_body.exp + Exp, is_change = 1},
                    lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody),
                    log_golden_body_stage(Player#player.key, Player#player.nickname, NewGoldenBody#st_golden_body.stage, GoldenBody#st_golden_body.stage, NewGoldenBody#st_golden_body.exp, GoldenBody#st_golden_body.exp, 0),
                    {Player, GoodsList}
            end;
        true ->
            NextBaseData = data_golden_body_stage:get(GoldenBody#st_golden_body.stage + 1),
            NewGoldenBody = GoldenBody#st_golden_body{exp = 0, stage = GoldenBody#st_golden_body.stage + 1, bless_cd = 0, golden_body_id = NextBaseData#base_golden_body_stage.golden_body_id, is_change = 1},
            NewGoldenBody1 = golden_body_init:calc_attribute(NewGoldenBody),
            notice_sys:add_notice(player_view, [Player, 8, NewGoldenBody1#st_golden_body.stage]),
            lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody1),
            NewPlayer = player_util:count_player_attribute(Player#player{golden_body_id = NewGoldenBody1#st_golden_body.golden_body_id}, true),
            scene_agent_dispatch:golden_body_update(NewPlayer),
            BaseData = data_golden_body_stage:get(GoldenBody#st_golden_body.stage),
            log_golden_body_stage(Player#player.key, Player#player.nickname, NewGoldenBody#st_golden_body.stage, GoldenBody#st_golden_body.stage, NewGoldenBody#st_golden_body.exp, GoldenBody#st_golden_body.exp, 0),
            achieve:trigger_achieve(Player, ?ACHIEVE_TYPE_1, ?ACHIEVE_SUBTYPE_1034, 0, NewGoldenBody#st_golden_body.stage),
            goods_add_stage(NewPlayer, T, GoodsList ++ tuple_to_list(BaseData#base_golden_body_stage.award))
    end.

%%使用物品增加到指定阶数 1 3
goods_add_to_stage(Player, [], GoodsList) -> {Player, GoodsList};
goods_add_to_stage(Player, [{Stage, Exp} | T], GoodsList) ->
    GoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),
    MaxStage = data_golden_body_stage:max_stage(),
    if GoldenBody#st_golden_body.stage >= MaxStage -> {Player, GoodsList};
        GoldenBody#st_golden_body.stage >= Stage ->
            BaseData = data_golden_body_stage:get(GoldenBody#st_golden_body.stage),
            NewExp = GoldenBody#st_golden_body.exp + Exp,
            if NewExp >= BaseData#base_golden_body_stage.exp ->
                NextBaseData = data_golden_body_stage:get(GoldenBody#st_golden_body.stage + 1),
                NewGoldenBody = GoldenBody#st_golden_body{exp = 0, stage = GoldenBody#st_golden_body.stage + 1, bless_cd = 0, golden_body_id = NextBaseData#base_golden_body_stage.golden_body_id, is_change = 1},
                NewGoldenBody1 = golden_body_init:calc_attribute(NewGoldenBody),
                lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody1),
                NewPlayer = player_util:count_player_attribute(Player#player{golden_body_id = NewGoldenBody1#st_golden_body.golden_body_id}, true),
                scene_agent_dispatch:golden_body_update(NewPlayer),
                log_golden_body_stage(Player#player.key, Player#player.nickname, NewGoldenBody#st_golden_body.stage, GoldenBody#st_golden_body.stage, NewGoldenBody#st_golden_body.exp, GoldenBody#st_golden_body.exp, 0),
                achieve:trigger_achieve(Player, ?ACHIEVE_TYPE_1, ?ACHIEVE_SUBTYPE_1034, 0, NewGoldenBody#st_golden_body.stage),
                goods_add_stage(NewPlayer, T, GoodsList ++ tuple_to_list(BaseData#base_golden_body_stage.award));
                true ->
                    GoldenBody1 = set_bless_cd(GoldenBody, BaseData#base_golden_body_stage.cd),
                    NewGoldenBody = GoldenBody1#st_golden_body{exp = GoldenBody#st_golden_body.exp + Exp, is_change = 1},
                    lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody),
                    log_golden_body_stage(Player#player.key, Player#player.nickname, NewGoldenBody#st_golden_body.stage, GoldenBody#st_golden_body.stage, NewGoldenBody#st_golden_body.exp, GoldenBody#st_golden_body.exp, 0),
                    {Player, GoodsList}
            end;
        true ->
            F = fun(_, {M, GList}) ->
                NextBaseData = data_golden_body_stage:get(M#st_golden_body.stage + 1),
                NewM = M#st_golden_body{exp = 0, stage = M#st_golden_body.stage + 1, bless_cd = 0, golden_body_id = NextBaseData#base_golden_body_stage.golden_body_id, is_change = 1},
                BaseData = data_golden_body_stage:get(M#st_golden_body.stage),
                {NewM, GList ++ tuple_to_list(BaseData#base_golden_body_stage.award)}
                end,
            {NewGoldenBody, GoodsList1} = lists:foldl(F, {GoldenBody, []}, lists:seq(GoldenBody#st_golden_body.stage, Stage - 1)),
            log_golden_body_stage(Player#player.key, Player#player.nickname, NewGoldenBody#st_golden_body.stage, GoldenBody#st_golden_body.stage, NewGoldenBody#st_golden_body.exp, GoldenBody#st_golden_body.exp, 0),
            NewGoldenBody1 = golden_body_init:calc_attribute(NewGoldenBody),
            notice_sys:add_notice(player_view, [Player, 8, NewGoldenBody1#st_golden_body.stage]),
            lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody1),
            NewPlayer = player_util:count_player_attribute(Player#player{golden_body_id = NewGoldenBody1#st_golden_body.golden_body_id}, true),
            scene_agent_dispatch:golden_body_update(NewPlayer),
            achieve:trigger_achieve(Player, ?ACHIEVE_TYPE_1, ?ACHIEVE_SUBTYPE_1034, 0, NewGoldenBody#st_golden_body.stage),
            goods_add_to_stage(NewPlayer, T, GoodsList ++ GoodsList1)
    end.

%%物品增加1阶 特定等级
goods_add_stage_limit(Player, [], GoodsList) -> {Player, GoodsList};
goods_add_stage_limit(Player, [{Stage, Exp} | T], GoodsList) ->
    GoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),
    MaxStage = data_golden_body_stage:max_stage(),
    if GoldenBody#st_golden_body.stage >= MaxStage -> {Player, GoodsList};
        GoldenBody#st_golden_body.stage > Stage ->
            BaseData = data_golden_body_stage:get(GoldenBody#st_golden_body.stage),
            NewExp = GoldenBody#st_golden_body.exp + Exp,
            if NewExp >= BaseData#base_golden_body_stage.exp ->
                NextBaseData = data_golden_body_stage:get(GoldenBody#st_golden_body.stage + 1),
                NewGoldenBody = GoldenBody#st_golden_body{exp = 0, stage = GoldenBody#st_golden_body.stage + 1, bless_cd = 0, golden_body_id = NextBaseData#base_golden_body_stage.golden_body_id, is_change = 1},
                NewGoldenBody1 = golden_body_init:calc_attribute(NewGoldenBody),
                lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody1),
                NewPlayer = player_util:count_player_attribute(Player#player{golden_body_id = NewGoldenBody1#st_golden_body.golden_body_id}, true),
                scene_agent_dispatch:golden_body_update(NewPlayer),
                log_golden_body_stage(Player#player.key, Player#player.nickname, NewGoldenBody#st_golden_body.stage, GoldenBody#st_golden_body.stage, NewGoldenBody#st_golden_body.exp, GoldenBody#st_golden_body.exp, 0),
                achieve:trigger_achieve(Player, ?ACHIEVE_TYPE_1, ?ACHIEVE_SUBTYPE_1034, 0, NewGoldenBody#st_golden_body.stage),
                goods_add_stage(NewPlayer, T, GoodsList ++ tuple_to_list(BaseData#base_golden_body_stage.award));
                true ->
                    GoldenBody1 = set_bless_cd(GoldenBody, BaseData#base_golden_body_stage.cd),
                    NewGoldenBody = GoldenBody1#st_golden_body{exp = GoldenBody#st_golden_body.exp + Exp, is_change = 1},
                    lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody),
                    log_golden_body_stage(Player#player.key, Player#player.nickname, NewGoldenBody#st_golden_body.stage, GoldenBody#st_golden_body.stage, NewGoldenBody#st_golden_body.exp, GoldenBody#st_golden_body.exp, 0),
                    {Player, GoodsList}
            end;
        true ->
            NextBaseData = data_golden_body_stage:get(GoldenBody#st_golden_body.stage + 1),
            NewGoldenBody = GoldenBody#st_golden_body{exp = 0, stage = GoldenBody#st_golden_body.stage + 1, bless_cd = 0, golden_body_id = NextBaseData#base_golden_body_stage.golden_body_id, is_change = 1},
            NewGoldenBody1 = golden_body_init:calc_attribute(NewGoldenBody),
            notice_sys:add_notice(player_view, [Player, 8, NewGoldenBody1#st_golden_body.stage]),
            lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody1),
            NewPlayer = player_util:count_player_attribute(Player#player{golden_body_id = NewGoldenBody1#st_golden_body.golden_body_id}, true),
            scene_agent_dispatch:golden_body_update(NewPlayer),
            BaseData = data_golden_body_stage:get(GoldenBody#st_golden_body.stage),
%%            {ok, NewPlayer1} = goods:give_goods(NewPlayer, goods:make_give_goods_list(281, tuple_to_list(BaseData#base_golden_body_stage.award))),
            log_golden_body_stage(Player#player.key, Player#player.nickname, NewGoldenBody#st_golden_body.stage, GoldenBody#st_golden_body.stage, NewGoldenBody#st_golden_body.exp, GoldenBody#st_golden_body.exp, 0),
            achieve:trigger_achieve(Player, ?ACHIEVE_TYPE_1, ?ACHIEVE_SUBTYPE_1034, 0, NewGoldenBody#st_golden_body.stage),
            goods_add_stage_limit(NewPlayer, T, GoodsList ++ tuple_to_list(BaseData#base_golden_body_stage.award))
    end.

%%升阶
upgrade_stage(Player, IsAuto) ->
    OpenLv = ?GOLDEN_BODY_OPEN_LV,
    if Player#player.lv < OpenLv -> {false, 2};
        true ->
            MaxStage = data_golden_body_stage:max_stage(),
            GoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),
            if GoldenBody#st_golden_body.stage >= MaxStage -> {false, 3};
                GoldenBody#st_golden_body.stage == 0 -> {false, 0};
                true ->
                    BaseData = data_golden_body_stage:get(GoldenBody#st_golden_body.stage),
                    case check_goods(Player, BaseData, IsAuto) of
                        {false, Err} -> {false, Err};
                        {true, Player1} ->
                            GoldenBody1 = add_exp(GoldenBody, BaseData, Player#player.vip_lv),
                            log_golden_body_stage(Player#player.key, Player#player.nickname, GoldenBody1#st_golden_body.stage, GoldenBody#st_golden_body.stage, GoldenBody1#st_golden_body.exp, GoldenBody#st_golden_body.exp, 0),
                            OldExpPercent = util:floor(GoldenBody#st_golden_body.exp / BaseData#base_golden_body_stage.exp * 100),
                            NewExpPercent = util:floor(GoldenBody1#st_golden_body.exp / BaseData#base_golden_body_stage.exp * 100),
                            if
                                GoldenBody1#st_golden_body.stage /= GoldenBody#st_golden_body.stage ->
                                    NewGoldenBody = golden_body_init:calc_attribute(GoldenBody1),
                                    lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody),
                                    NewPlayer = player_util:count_player_attribute(Player1#player{golden_body_id = NewGoldenBody#st_golden_body.golden_body_id}, true),
                                    scene_agent_dispatch:golden_body_update(NewPlayer),
                                    {ok, NewPlayer1} = goods:give_goods(NewPlayer, goods:make_give_goods_list(281, tuple_to_list(BaseData#base_golden_body_stage.award))),
                                    achieve:trigger_achieve(Player, ?ACHIEVE_TYPE_1, ?ACHIEVE_SUBTYPE_1034, 0, NewGoldenBody#st_golden_body.stage),
                                    notice_sys:add_notice(player_view, [Player, 8, GoldenBody1#st_golden_body.stage]),
                                    {ok, 7, NewPlayer1};
                                OldExpPercent /= NewExpPercent ->
                                    NewGoldenBody = golden_body_init:calc_attribute(GoldenBody1),
                                    lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody),
                                    NewPlayer = player_util:count_player_attribute(Player, true),
                                    scene_agent_dispatch:attribute_update(NewPlayer),
                                    {ok, 1, NewPlayer};
                                true ->
                                    lib_dict:put(?PROC_STATUS_GOLDEN_BODY, GoldenBody1),
                                    {ok, 1, Player1}
                            end
                    end
            end
    end.

%%升阶
check_upgrade_stage_state(Player, Tips) ->
    OpenLv = ?GOLDEN_BODY_OPEN_LV,
    if Player#player.lv < OpenLv -> Tips;
        true ->
            MaxStage = data_golden_body_stage:max_stage(),
            GoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),
            BaseData = data_golden_body_stage:get(GoldenBody#st_golden_body.stage),
            if
                GoldenBody#st_golden_body.stage >= MaxStage -> Tips;
                BaseData#base_golden_body_stage.cd > 0 -> Tips;
                true ->
                    case check_goods(Player, BaseData, 0, false) of
                        {false, _Err} -> Tips;
                        {true, _Player1} ->
                            Tips#tips{state = 1}
                    end
            end
    end.

%%今日是否有双倍
check_double(_Vip) -> false.

log_golden_body_stage(Pkey, NickName, NewStage, Stage, NewExp, Exp, Type) ->
    Sql = io_lib:format("insert into log_golden_body_stage set pkey=~p,nickname='~s',stage=~p,old_stage=~p,exp=~p,old_exp=~p,time=~p,`type`=~p",
        [Pkey, NickName, NewStage, Stage, NewExp, Exp, util:unixtime(), Type]),
    log_proc:log(Sql),
    ok.

%%增加经验
add_exp(GoldenBody, BaseData, Vip) ->
    IsDouble = check_double(Vip),
    Mult = ?IF_ELSE(IsDouble, 2, 1),
    Exp = util:rand(BaseData#base_golden_body_stage.exp_min, BaseData#base_golden_body_stage.exp_max) * Mult,
    %%经验满了,升阶
    if GoldenBody#st_golden_body.exp + Exp >= BaseData#base_golden_body_stage.exp ->
        NextBaseData = data_golden_body_stage:get(GoldenBody#st_golden_body.stage + 1),
        GoldenBody#st_golden_body{exp = 0, stage = GoldenBody#st_golden_body.stage + 1, bless_cd = 0, golden_body_id = NextBaseData#base_golden_body_stage.golden_body_id, is_change = 1};
        true ->
            GoldenBody1 = set_bless_cd(GoldenBody, BaseData#base_golden_body_stage.cd),
            GoldenBody1#st_golden_body{exp = GoldenBody#st_golden_body.exp + Exp, is_change = 1}
    end.

%%检查物品是否足够
check_goods(Player, BaseData, IsAuto) ->
    check_goods(Player, BaseData, IsAuto, true).

check_goods(Player, BaseData, IsAuto, IsNotice) ->
    CountList = [{Gid, goods_util:get_goods_count(Gid)} || Gid <- tuple_to_list(BaseData#base_golden_body_stage.goods_ids)],
    Num = BaseData#base_golden_body_stage.num,
    Agolden_body = lists:sum([Val || {_, Val} <- CountList]),
    if Agolden_body >= Num ->
        if
            IsNotice == true ->
                DelGoodsList = goods_num(CountList, Num, []),
                goods:subtract_good(Player, DelGoodsList, 281);
            true ->
                ok
        end,
        {true, Player};
        Agolden_body < Num andalso IsAuto == 1 ->
            case new_shop:get_goods_price(BaseData#base_golden_body_stage.gid_auto) of
                false -> {false, 4};
                {ok, Type, Price} ->
                    Money = Price * (Num - Agolden_body),
                    case money:is_enough(Player, Money, Type) of
                        false -> {false, 5};
                        true ->
                            if
                                IsNotice == true ->
                                    DelGoodsList = goods_num(CountList, Num, []),
                                    goods:subtract_good(Player, DelGoodsList, 281),
                                    NewPlayer = money:cost_money(Player, Type, -Money, 281, BaseData#base_golden_body_stage.gid_auto, Num - Agolden_body),
                                    {true, NewPlayer};
                                true ->
                                    {true, Player}
                            end
                    end
            end;
        true ->
            if
                IsNotice == true ->
                    goods_util:client_popup_goods_not_enough(Player, BaseData#base_golden_body_stage.gid_auto, Num, 281);
                true -> skip
            end,
            {false, 6}
    end.

goods_num([], _, GoodsList) -> GoodsList;
goods_num(_, 0, GoodsList) -> GoodsList;
goods_num([{Gid, Num} | T], NeedNum, GoodsList) ->
    if Num =< 0 -> goods_num(T, NeedNum, GoodsList);
        Num < NeedNum ->
            goods_num(T, NeedNum - Num, [{Gid, Num} | GoodsList]);
        true ->
            [{Gid, NeedNum} | GoodsList]
    end.


%%设置超时CD
set_bless_cd(GoldenBody, Cd) ->
    if GoldenBody#st_golden_body.bless_cd > 0 -> GoldenBody;
        GoldenBody#st_golden_body.exp > 0 -> GoldenBody;
        Cd > 0 ->
            GoldenBody#st_golden_body{bless_cd = Cd + util:unixtime()};
        true ->
            GoldenBody
    end.


%%祝福重置
bless_cd_reset(Player, Now) ->
    GoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),
    if GoldenBody#st_golden_body.bless_cd > 0 ->
        if GoldenBody#st_golden_body.bless_cd > Now ->
            Player;
            true ->
                mail_bless_reset(Player#player.key, GoldenBody#st_golden_body.stage),
                GoldenBody1 = GoldenBody#st_golden_body{bless_cd = 0, exp = 0, is_change = 1},
                NewGoldenBody = golden_body_init:calc_attribute(GoldenBody1),
                lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody),
                player_bless:refresh_bless(Player#player.sid, 8, 0),
                NewPlayer = player_util:count_player_attribute(Player, true),
                scene_agent_dispatch:attribute_update(NewPlayer),
                log_golden_body_stage(Player#player.key, Player#player.nickname, NewGoldenBody#st_golden_body.stage, GoldenBody#st_golden_body.stage, NewGoldenBody#st_golden_body.exp, GoldenBody#st_golden_body.exp, 1),
                NewPlayer
        end;
        true -> Player
    end.

%%祝福经验清0通知
mail_bless_reset(Key, Lv) ->
    Content = io_lib:format(?T("您的~p级金身祝福时间到期,祝福值清零"), [Lv]),
    mail:sys_send_mail([Key], ?T("祝福清零"), Content),
    ok.

%%获取祝福状态
check_bless_state(Now) ->
    GoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),
    if GoldenBody#st_golden_body.bless_cd > Now -> [[8, GoldenBody#st_golden_body.bless_cd - Now]];
        true -> []
    end.


%%装备物品
equip_goods(Player, GoodsKey) ->
    GoodsSt = lib_dict:get(?PROC_STATUS_GOODS),
    case catch goods_util:get_goods(GoodsKey, GoodsSt#st_goods.dict) of
        {false, ?ER_VERIFY_FAILL_GOODS_NOT_EXIST} ->
            {16, Player};
        Goods ->
            case data_goods:get(Goods#goods.goods_id) of
                [] -> {16, Player};
                GoodsType ->
                    GoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),
                    if GoodsType#goods_type.need_lv > GoldenBody#st_golden_body.stage -> {17, Player};
                        true ->
                            SubtypeList = [?GOODS_SUBTYPE_EQUIP_GOLDEN_BODY_1, ?GOODS_SUBTYPE_EQUIP_GOLDEN_BODY_2, ?GOODS_SUBTYPE_EQUIP_GOLDEN_BODY_3, ?GOODS_SUBTYPE_EQUIP_GOLDEN_BODY_4],
                            case lists:member(GoodsType#goods_type.subtype, SubtypeList) of
                                false -> {18, Player};
                                true ->
                                    NeedGoods = Goods#goods{location = ?GOODS_LOCATION_GOLDEN_BODY, cell = GoodsType#goods_type.subtype, bind = ?BIND},

                                    GoodsDict = goods_dict:update_goods(NeedGoods, GoodsSt#st_goods.dict),
                                    goods_pack:pack_send_goods_info([NeedGoods], GoodsSt#st_goods.sid),

                                    EquipList =
                                        case lists:keytake(GoodsType#goods_type.subtype, 1, GoldenBody#st_golden_body.equip_list) of
                                            false ->
                                                _OldGoodsId = 0,
                                                NewGoodsSt = GoodsSt#st_goods{leftover_cell_num = GoodsSt#st_goods.leftover_cell_num + 1, dict = GoodsDict},
                                                [{GoodsType#goods_type.subtype, Goods#goods.goods_id, Goods#goods.key} | GoldenBody#st_golden_body.equip_list];
                                            {value, {_, _OldGoodsId, OldGoodsKey}, T} ->
                                                case catch goods_util:get_goods(OldGoodsKey, GoodsSt#st_goods.dict) of
                                                    {false, ?ER_VERIFY_FAILL_GOODS_NOT_EXIST} ->
                                                        GoodsDict1 = GoodsDict;
                                                    GoodsOld ->
                                                        NewGoodsOld = GoodsOld#goods{location = ?GOODS_LOCATION_BAG, cell = 0},
                                                        goods_pack:pack_send_goods_info([NewGoodsOld], GoodsSt#st_goods.sid),
                                                        goods_load:dbup_goods_cell_location(NewGoodsOld),
                                                        GoodsDict1 = goods_dict:update_goods(NewGoodsOld, GoodsDict)
                                                end,
                                                NewGoodsSt = GoodsSt#st_goods{dict = GoodsDict1},
                                                [{GoodsType#goods_type.subtype, Goods#goods.goods_id, Goods#goods.key} | T]
                                        end,
                                    lib_dict:put(?PROC_STATUS_GOODS, NewGoodsSt),
                                    goods_load:dbup_goods_cell_location(NeedGoods),
                                    GoldenBody1 = GoldenBody#st_golden_body{equip_list = EquipList, is_change = 1},
                                    NewGoldenBody = golden_body_init:calc_attribute(GoldenBody1),
                                    lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody),
                                    NewPlayer = player_util:count_player_attribute(Player, true),
                                    log_golden_body_equip(Player#player.key, Player#player.nickname, GoodsType#goods_type.subtype, _OldGoodsId, GoodsType#goods_type.goods_id),
                                    {1, NewPlayer}
                            end
                    end
            end
    end.

%% 检查是否有装备可以熔炼
get_equip_smelt_state() ->
    GoodsList = goods_util:get_goods_list_by_type_list(?GOODS_LOCATION_BAG, [?GOODS_TYPE_EQUIP10]),
    GoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),
    F = fun(Goods) ->
        if
            Goods#goods.bind /= ?BIND -> false;
            true ->
                GoodsType = data_goods:get(Goods#goods.goods_id),
                case lists:keyfind(GoodsType#goods_type.subtype, 1, GoldenBody#st_golden_body.equip_list) of
                    false -> false;
                    {_Subtype, _GoodsId, GoodsKey} ->
                        if
                            GoodsKey == Goods#goods.key -> false;
                            true ->
                                WearGoods = goods_util:get_goods(GoodsKey),
                                if
                                    Goods#goods.combat_power > WearGoods#goods.combat_power -> false;
                                    true -> true
                                end
                        end
                end
        end
        end,
    case lists:any(F, GoodsList) of
        false -> 0;
        true -> 1
    end.

log_golden_body_equip(Pkey, Nickname, Subtype, OldGid, NewGid) ->
    Sql = io_lib:format("insert into log_golden_body_equip set pkey=~p,nickname='~s',subtype=~p,old_gid=~p,new_gid=~p,time=~p", [Pkey, Nickname, Subtype, OldGid, NewGid, util:unixtime()]),
    log_proc:log(Sql).


use_golden_body_dan(Player) ->
    case data_grow_dan:get(?GOODS_GROW_ID_GOLDEN_BODY) of
        [] -> {false, 0}; %% 配表错误
        Base ->
            GoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),  %% 玩家神兵
            case lists:keyfind(GoldenBody#st_golden_body.stage, 1, Base#base_grow_dan.stage_max_num) of
                false ->
                    {false, 0};
                {_, MaxNum} ->
                    if
                        GoldenBody#st_golden_body.grow_num >= MaxNum ->
                            {false, 19}; %% 成长丹已达到使用上限
                        true ->
                            if
                                Base#base_grow_dan.step_lim > GoldenBody#st_golden_body.stage ->
                                    {false, 20};  %% 未达到使用阶级
                                true ->
                                    GrowNum = goods_util:get_goods_count(?GOODS_GROW_ID_GOLDEN_BODY),
                                    if
                                        GrowNum == 0 ->
                                            goods_util:client_popup_goods_not_enough(Player, Base#base_grow_dan.goods_id, 0, 282),
                                            {false, 21}; %% 成长丹不足
                                        true ->
                                            DeleteGrowNum = min(MaxNum - GoldenBody#st_golden_body.grow_num, GrowNum),
                                            goods:subtract_good(Player, [{?GOODS_GROW_ID_GOLDEN_BODY, DeleteGrowNum}], 282), %% 扣除成长丹
                                            NewGoldenBody0 = GoldenBody#st_golden_body{grow_num = GoldenBody#st_golden_body.grow_num + DeleteGrowNum, is_change = 1},
                                            NewGoldenBody1 = golden_body_init:calc_attribute(NewGoldenBody0),
                                            lib_dict:put(?PROC_STATUS_GOLDEN_BODY, NewGoldenBody1),
                                            NewPlayer = player_util:count_player_attribute(Player, true),
                                            scene_agent_dispatch:attribute_update(NewPlayer),
                                            achieve:trigger_achieve(Player, ?ACHIEVE_TYPE_1, ?ACHIEVE_SUBTYPE_1035, 0, DeleteGrowNum),
                                            {ok, NewPlayer}
                                    end
                            end
                    end
            end
    end.

check_use_golden_body_dan_state(_Player, Tips) ->
    case data_grow_dan:get(?GOODS_GROW_ID_GOLDEN_BODY) of
        Base ->
            GoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),  %% 玩家神兵
            {_, MaxNum} = lists:keyfind(GoldenBody#st_golden_body.stage, 1, Base#base_grow_dan.stage_max_num),
            if
                GoldenBody#st_golden_body.grow_num >= MaxNum ->
                    Tips; %% 成长丹已达到使用上限
                true ->
                    if
                        Base#base_grow_dan.step_lim > GoldenBody#st_golden_body.stage ->
                            Tips;  %% 未达到使用阶级
                        true ->
                            GrowNum = goods_util:get_goods_count(?GOODS_GROW_ID_GOLDEN_BODY),
                            if
                                GrowNum == 0 ->
                                    Tips; %% 成长丹不足
                                true ->
                                    Tips#tips{state = 1}
                            end
                    end
            end
    end.

check_upgrade_jp_state(Player, Tips, GoodsType) ->
    if
        Player#player.lv < GoodsType#goods_type.need_lv ->
            Tips;
        true ->
            NewNum = case catch goods_attr_dan:use_goods_check(GoodsType#goods_type.goods_id, goods_util:get_goods_count(GoodsType#goods_type.goods_id), Player) of
                         N when is_integer(N) ->
                             N;
                         _Other ->
                             0
                     end,
            if
                NewNum > 0 ->
                    Tips#tips{state = 1};
                true ->
                    Tips
            end
    end.
