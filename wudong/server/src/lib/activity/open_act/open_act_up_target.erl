%%%-------------------------------------------------------------------
%%% @author li
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 进阶目标
%%% @end
%%% Created : 25. 二月 2017 14:26
%%%-------------------------------------------------------------------
-module(open_act_up_target).
-author("li").

-include("common.hrl").
-include("server.hrl").
-include("activity.hrl").
-include("mount.hrl").
-include("wing.hrl").
-include("magic_weapon.hrl").
-include("light_weapon.hrl").
-include("pet.hrl").
-include("pet_weapon.hrl").
-include("footprint_new.hrl").
-include("goods.hrl").
-include("cat.hrl").
-include("golden_body.hrl").
-include("god_treasure.hrl").
-include("jade.hrl").
-include("baby_wing.hrl").
-include("baby_mount.hrl").
-include("baby_weapon.hrl").

%% API
-export([
    init/1,
    midnight_refresh/1,
    get_act_info/1,
    recv/3,
    get_state/1,
    get_act/0,
    get_sub_act_type/0,
    get_status/3
]).

init(#player{key = Pkey} = Player) ->
    StOpenActUpTarget =
        case player_util:is_new_role(Player) of
            true -> #st_open_act_up_target{pkey = Pkey};
            false -> activity_load:dbget_open_act_up_target(Pkey)
        end,
    lib_dict:put(?PROC_STATUS_OPEN_ACT_UP_TARGET, StOpenActUpTarget),
    update_open_act_up_target(),
    Player.

update_open_act_up_target() ->
    StOpenActUpTarget = lib_dict:get(?PROC_STATUS_OPEN_ACT_UP_TARGET),
    #st_open_act_up_target{
        pkey = Pkey,
        open_day = OpenDay
    } = StOpenActUpTarget,
    SysOpenDay = config:get_open_days(),
    if
        SysOpenDay =/= OpenDay ->
            NewStOpenActUpTarget = #st_open_act_up_target{pkey = Pkey, open_day = SysOpenDay, op_time = util:unixtime()};
        true ->
            NewStOpenActUpTarget = StOpenActUpTarget
    end,
    lib_dict:put(?PROC_STATUS_OPEN_ACT_UP_TARGET, NewStOpenActUpTarget).

%% 凌晨重置不操作数据库
midnight_refresh(_ResetTime) ->
    update_open_act_up_target().

get_act_info(Player) ->
    update_open_act_up_target(),
    StOpenActUpTarget = lib_dict:get(?PROC_STATUS_OPEN_ACT_UP_TARGET),
    #st_open_act_up_target{
        recv_list = RecvList
    } = StOpenActUpTarget,
    case get_act() of
        false ->
            {0, []};
        ActType ->
            LTime = util:unixdate()+?ONE_DAY_SECONDS - util:unixtime(),
            F = fun(BaseId) ->
                #base_up_target{type = BaseType, args = Args, reward_list = RewardList} = data_up_target:get(BaseId),
                L =  lists:map(fun({GoodsId, GoodsNum, Time}) -> [GoodsId, GoodsNum, Time] end, RewardList),
                case lists:member({BaseType, Args}, RecvList) of
                    false ->
                        Status = get_status(Player, BaseType, Args),
                        [BaseType, Args, Status, L];
                    _ ->
                        [BaseType, Args, 2, L]
                end
            end,
            List = lists:map(F, data_up_target:get_ids_by_actType(ActType)),
            {LTime, List}
    end.

get_status(_Player, ?OPEN_UP_TARGET_MOUNT, Args) ->
    Mount = mount_util:get_mount(),
    ?IF_ELSE(Mount#st_mount.stage >= Args, 1, 0);

get_status(_Player, ?OPEN_UP_TARGET_WING, Args) ->
    WingSt = lib_dict:get(?PROC_STATUS_WING),
    ?IF_ELSE(WingSt#st_wing.stage >= Args, 1, 0);

get_status(_Player, ?OPEN_UP_TARGET_MAGIC_WEAPON, Args) ->
    MagicWeapon = lib_dict:get(?PROC_STATUS_MAGIC_WEAPON),
    ?IF_ELSE(MagicWeapon#st_magic_weapon.stage >= Args, 1, 0);

get_status(_Player, ?OPEN_UP_TARGET_LIGHT_WEAPON, Args) ->
    LightWeapon = lib_dict:get(?PROC_STATUS_LIGHT_WEAPON),
    ?IF_ELSE(LightWeapon#st_light_weapon.stage >= Args, 1, 0);

get_status(_Player, ?OPEN_UP_TARGET_PET_WEAPON, Args) ->
    PetWeapon = lib_dict:get(?PROC_STATUS_PET_WEAPON),
    ?IF_ELSE(PetWeapon#st_pet_weapon.stage >= Args, 1, 0);

get_status(_Player, ?OPEN_UP_TARGET_PET_UP_LV, Args) ->
   PetSt = lib_dict:get(?PROC_STATUS_PET),
   TotalLv = PetSt#st_pet.stage,
   ?IF_ELSE(TotalLv >= Args, 1, 0);

get_status(_Player, ?OPEN_UP_TARGET_PET_UP_STAR, Args) ->
    PetSt = lib_dict:get(?PROC_STATUS_PET),
    PetList = PetSt#st_pet.pet_list,
    F = fun(#pet{star = Lv}) -> Lv end,
    TotalLv = lists:map(F, PetList),
    ?IF_ELSE(lists:max([0] ++ TotalLv) >= Args, 1, 0);

get_status(_Player, ?OPEN_UP_TARGET_FOOTPRINT, Args) ->
    PetWeapon = lib_dict:get(?PROC_STATUS_FOOTPRINT),
    ?IF_ELSE(PetWeapon#st_footprint.stage >= Args, 1, 0);

get_status(_Player, ?OPEN_UP_TARGET_CAT_UP_LV, Args) ->
    Cat = lib_dict:get(?PROC_STATUS_CAT),
    ?IF_ELSE(Cat#st_cat.stage >= Args, 1, 0);

get_status(_Player, ?OPEN_UP_TARGET_GOLDEN_BODY_UP_LV, Args) ->
    GoldenBody = lib_dict:get(?PROC_STATUS_GOLDEN_BODY),
    ?IF_ELSE(GoldenBody#st_golden_body.stage >= Args, 1, 0);
get_status(_Player, ?OPEN_UP_TARGET_GOD_TREASURE_UP_LV, Args) ->
    GodTreasure = lib_dict:get(?PROC_STATUS_GOD_TREASURE),
    ?IF_ELSE(GodTreasure#st_god_treasure.stage >= Args, 1, 0);

get_status(_Player, ?OPEN_UP_TARGET_JADE_UP_LV, Args) ->
    JADE = lib_dict:get(?PROC_STATUS_JADE),
    ?IF_ELSE(JADE#st_jade.stage >= Args, 1, 0);

get_status(_Player, ?OPEN_UP_TARGET_BABY_WING, Args) ->
    BabyWing = lib_dict:get(?PROC_STATUS_BABY_WING),
    ?IF_ELSE(BabyWing#st_baby_wing.stage >= Args, 1, 0);
get_status(_Player, ?OPEN_UP_TARGET_BABY_MOUNT, Args) ->
    BabyMount = lib_dict:get(?PROC_STATUS_BABY_MOUNT),
    ?IF_ELSE(BabyMount#st_baby_mount.stage >= Args, 1, 0);
get_status(_Player, ?OPEN_UP_TARGET_BABY_WEAPON, Args) ->
    BabyWeapon = lib_dict:get(?PROC_STATUS_BABY_WEAPON),
    ?IF_ELSE(BabyWeapon#st_baby_weapon.stage >= Args, 1, 0);

get_status(_Player, _ActType, _Args) ->
    0.

recv(Player, BaseType, Args) ->
    StOpenActUpTarget = lib_dict:get(?PROC_STATUS_OPEN_ACT_UP_TARGET),
    #st_open_act_up_target{
        recv_list = RecvList
    } = StOpenActUpTarget,
    case get_act() of
        [] ->
            {4, Player}; %% 活动未开启
        ActType ->
            IsRecv = lists:member({BaseType, Args}, RecvList),
            Status = get_status(Player, BaseType, Args),
            if
                IsRecv == true ->
                    {3, Player}; %% 已经领取
                Status == 0 ->
                    {2, Player}; %% 未达条件
                true ->
                    F = fun({BaseType0, Args0, _GidtId0}) ->
                        BaseType0 == BaseType andalso Args0 == Args
                    end,
                    case lists:filter(F, get_base_list(ActType)) of
                        [] ->
                            {0, Player}; %% 配置参数错误
                        [{_BaseType, _Args, RewardList} | _] ->
                            Now = util:unixtime(),
                            F1 = fun({GoodId, GoodsNum, ExpireTime}) ->
                                case ExpireTime == 0 of
                                    true ->
                                        goods:make_give_goods_list(606, [{GoodId, GoodsNum}]);
                                    false ->
                                        goods:make_give_goods_list(606, [{GoodId, GoodsNum, 0, ExpireTime * ?ONE_HOUR_SECONDS + Now}])
                                end
                            end,
                            GiveGoodsList = lists:flatmap(F1, RewardList),
                            {ok, NewPlayer} = goods:give_goods(Player, GiveGoodsList),
                            NewStOpenActUpTarget = StOpenActUpTarget#st_open_act_up_target{recv_list = [{BaseType, Args} | RecvList], op_time = util:unixtime()},
                            lib_dict:put(?PROC_STATUS_OPEN_ACT_UP_TARGET, NewStOpenActUpTarget),
                            activity_load:dbup_open_act_up_target(NewStOpenActUpTarget),
                            activity:get_notice(Player, [33], true),
                            {1, NewPlayer}
                    end
            end
    end.

get_state(Player) ->
    case get_act() of
        false ->
            -1; %% 活动未开启
        ActType ->
            StOpenActUpTarget = lib_dict:get(?PROC_STATUS_OPEN_ACT_UP_TARGET),
            #st_open_act_up_target{
                recv_list = RecvList
            } = StOpenActUpTarget,
            F0 = fun(BaseId) ->
                #base_up_target{type = BaseType, args = Args, reward_list = RewardList} = data_up_target:get(BaseId),
                L =  lists:map(fun({GoodsId, GoodsNum, Time}) -> [GoodsId, GoodsNum, Time] end, RewardList),
                case lists:member({BaseType, Args}, RecvList) of
                    false ->
                        Status = get_status(Player, BaseType, Args),
                        [BaseType, Args, Status, L];
                    _ ->
                        [BaseType, Args, 2, L]
                end
            end,
            List = lists:map(F0, data_up_target:get_ids_by_actType(ActType)),
            F = fun([_ActType, _Args, Status, _RewardList]) ->
                Status == 1
            end,
            LL = lists:filter(F, List),
            ?IF_ELSE(LL == [], 0, 1)
    end.

get_act() ->
    OpenDay = config:get_open_days(),
    get_act(OpenDay).
get_act(OpenDay) ->
    case ets:lookup(?ETS_ACT_OPEN_INFO, OpenDay) of
        [] -> false;
        [#ets_act_info{act_info = ActInfo}] ->
            case lists:keyfind(?ACT_UP_TARGET_ONE, 1, ActInfo) of
                false -> false;
                {_Act, ActType} -> ActType
            end
    end.

get_sub_act_type() ->
    case get_act() of
        false -> 0;
        ActType ->
            Ids = data_up_target:get_ids_by_actType(ActType),
            #base_up_target{type = Type} = data_up_target:get(hd(Ids)),
            Type
    end.

get_base_list(ActType) ->
    Ids = data_up_target:get_ids_by_actType(ActType),
    F = fun(Id) ->
        #base_up_target{type = Type, args = Args, reward_list = RewardList} = data_up_target:get(Id),
        {Type, Args, RewardList}
    end,
    lists:map(F, Ids).