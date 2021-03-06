%%%-------------------------------------------------------------------
%%% @author hxming
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 十一月 2016 16:01
%%%-------------------------------------------------------------------
-module(wing_skill).

-author("hxming").

-include("server.hrl").
-include("common.hrl").
-include("wing.hrl").
-include("skill.hrl").
-include("tips.hrl").

%% API
-export([
    get_wing_skill_list/1,
    calc_wing_skill_attribute/1,
    activate_skill/2,
    upgrade_skill/2,
    filter_skill_for_battle/1,
    calc_skill_cbp/0,

    check_upgrade_skill_state/2,
    check_activate_skill_state/2
]).

%%获取技能列表
get_wing_skill_list(SkillList) ->
    F = fun(Cell) ->
        case lists:keyfind(Cell, 1, SkillList) of
            false ->
                BaseActivate = data_wing_skill_activate:get(Cell),
                [Cell, BaseActivate#base_wing_skill_activate.skill_id, 0];
            {_, SkillId} ->
                [Cell, SkillId, 1]
        end
        end,
    lists:map(F, data_wing_skill_activate:cell_list()).


%%计算技能属性
calc_wing_skill_attribute(SkillList) ->
    F = fun({_Cell, SkillId}) ->
        case data_wing_skill_upgrade:get(SkillId) of
            [] -> [];
            BaseUpgrade -> BaseUpgrade#base_wing_skill_upgrade.attrs
        end
        end,
    AttrList = lists:flatmap(F, SkillList),
    attribute_util:make_attribute_by_key_val_list(AttrList).


%%激活技能
activate_skill(Player, Cell) ->
    WingSt = lib_dict:get(?PROC_STATUS_WING),
    case lists:keymember(Cell, 1, WingSt#st_wing.skill_list) of
        true -> {35, Player};
        false ->
            case data_wing_skill_activate:get(Cell) of
                [] -> {36, Player};
                BaseActivate ->
                    case WingSt#st_wing.stage >= BaseActivate#base_wing_skill_activate.stage of
                        false ->
                            {37, Player};
                        true ->
                            {GoodsId, Num} = BaseActivate#base_wing_skill_activate.goods,
                            case goods_util:get_goods_count(GoodsId) >= Num of
                                false ->
                                    goods_util:client_popup_goods_not_enough(Player, GoodsId, Num, 198),
                                    {38, Player};
                                true ->
                                    goods:subtract_good(Player, [{GoodsId, Num}], 198),
                                    SkillList = [{Cell, BaseActivate#base_wing_skill_activate.skill_id} | WingSt#st_wing.skill_list],
                                    WingSt1 = WingSt#st_wing{skill_list = SkillList, is_change = 1},
                                    NewWingSt = wing_attr:calc_wing_attr(WingSt1),
%%                                    wing_load:replace_wing(NewWingSt),
                                    lib_dict:put(?PROC_STATUS_WING, NewWingSt),
                                    PassiveSkillList = [{Sid, Type} || {Sid, Type} <- Player#player.passive_skill, Type /= ?PASSIVE_SKILL_TYPE_WING] ++ filter_skill_for_battle(SkillList),
                                    Player1 = Player#player{passive_skill = PassiveSkillList},
                                    NewPlayer = player_util:count_player_attribute(Player1, true),
                                    scene_agent_dispatch:passive_skill(Player, PassiveSkillList),
                                    log_wing_skill(Player#player.key,Player#player.nickname, Cell, 0, BaseActivate#base_wing_skill_activate.skill_id),
                                    {1, NewPlayer}
                            end
                    end
            end
    end.

check_activate_skill_state(_Player, Tips) ->
    WingSt = lib_dict:get(?PROC_STATUS_WING),
    F = fun(Cell) ->
        case lists:keymember(Cell, 1, WingSt#st_wing.skill_list) of
            true -> [];
            _ ->
                case data_wing_skill_activate:get(Cell) of
                    [] -> [];
                    BaseActivate ->
                        case WingSt#st_wing.stage >= BaseActivate#base_wing_skill_activate.stage of
                            false -> [];
                            true ->
                                {GoodsId, Num} = BaseActivate#base_wing_skill_activate.goods,
                                case goods_util:get_goods_count(GoodsId) >= Num of
                                    false -> [];
                                    true -> [1]
                                end
                        end
                end
        end
    end,
    List = lists:flatmap(F, data_wing_skill_activate:cell_list()),
    if
        List == [] -> Tips;
        true -> Tips#tips{state = 1}
    end.

%%升级技能
upgrade_skill(Player, Cell) ->
    WingSt = lib_dict:get(?PROC_STATUS_WING),
    case lists:keytake(Cell, 1, WingSt#st_wing.skill_list) of
        false -> {39, Player};
        {value, {_, OldSkillId}, T} ->
            case data_wing_skill_upgrade:get(OldSkillId) of
                [] -> {36, Player};
                BaseUpgrade ->
                    if WingSt#st_wing.stage < BaseUpgrade#base_wing_skill_upgrade.stage -> {37, Player};
                        BaseUpgrade#base_wing_skill_upgrade.new_skill_id == 0 -> {41, Player};
                        true ->
                            {GoodsId, Num} = BaseUpgrade#base_wing_skill_upgrade.goods,
                            case goods_util:get_goods_count(GoodsId) >= Num of
                                false ->
                                    goods_util:client_popup_goods_not_enough(Player, GoodsId, Num, 198),
                                    {40, Player};
                                true ->
                                    goods:subtract_good(Player, [{GoodsId, Num}], 199),
                                    SkillList = [{Cell, BaseUpgrade#base_wing_skill_upgrade.new_skill_id} | T],
                                    WingSt1 = WingSt#st_wing{skill_list = SkillList, is_change = 1},
                                    NewWingSt = wing_attr:calc_wing_attr(WingSt1),
%%                                    wing_load:replace_wing(NewWingSt),
                                    lib_dict:put(?PROC_STATUS_WING, NewWingSt),
                                    PassiveSkillList = [{Sid, Type} || {Sid, Type} <- Player#player.passive_skill, Type /= ?PASSIVE_SKILL_TYPE_WING] ++ filter_skill_for_battle(SkillList),
                                    Player1 = Player#player{passive_skill = PassiveSkillList},
                                    NewPlayer = player_util:count_player_attribute(Player1, true),
                                    scene_agent_dispatch:passive_skill(Player, PassiveSkillList),
                                    log_wing_skill(Player#player.key,Player#player.nickname, Cell, OldSkillId, BaseUpgrade#base_wing_skill_upgrade.new_skill_id),
                                    {1, NewPlayer}
                            end
                    end
            end
    end.

check_upgrade_skill_state(_Player, Tips) ->
    WingSt = lib_dict:get(?PROC_STATUS_WING),
    F = fun({_Cell, OldSkillId}) ->
        case data_wing_skill_upgrade:get(OldSkillId) of
            [] -> [];
            BaseUpgrade ->
                if WingSt#st_wing.stage < BaseUpgrade#base_wing_skill_upgrade.stage -> [];
                    BaseUpgrade#base_wing_skill_upgrade.new_skill_id == 0 -> [];
                    true ->
                        {GoodsId, Num} = BaseUpgrade#base_wing_skill_upgrade.goods,
                        case goods_util:get_goods_count(GoodsId) >= Num of
                            false ->
                                [];
                            true ->
                                [1]
                        end
                end
        end
    end,
    List = lists:flatmap(F, WingSt#st_wing.skill_list),
    if
        List == [] ->
            Tips;
        true ->
            Tips#tips{state = 1}
    end.

%%过滤战斗技能
filter_skill_for_battle(SkillList) ->
    F = fun({_Cell, SkillId}) ->
        case data_skill:get(SkillId) of
            [] -> [];
            Skill ->
                if Skill#skill.type == ?SKILL_TYPE_PASSIVE -> [{SkillId, ?PASSIVE_SKILL_TYPE_WING}];
                    true -> []
                end
        end
        end,
    lists:flatmap(F, SkillList).

%%计算技能战力
calc_skill_cbp() ->
    WingSt = lib_dict:get(?PROC_STATUS_WING),
    Fun = fun({_, SkillId}, Out) ->
        case data_skill:get(SkillId) of
            [] -> Out;
            Skill ->
                Skill#skill.skill_cbp + Out
        end
          end,
    round(lists:foldl(Fun, 0, WingSt#st_wing.skill_list)).


log_wing_skill(Pkey, Nickname, Cell, OldSkillid, NewSkillId) ->
    Sql = io_lib:format("insert into log_wing_skill set pkey=~p,nickname='~s',cell=~p,old_sid=~p,new_sid=~p,time=~p",
        [Pkey, Nickname, Cell, OldSkillid, NewSkillId, util:unixtime()]),
    log_proc:log(Sql).
