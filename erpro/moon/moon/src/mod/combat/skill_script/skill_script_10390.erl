%%----------------------------------------------------
%%
%% 当目标气血小于[HP百分比]时伤害增加[基础值+攻击*攻击转换系数]%，若自身气血不低于[气血百分比]%，则自身气血损耗[气血损耗比]%    
%%
%% args = [HP百分比，基础值，攻击转换系数，气血百分比，气血损耗比]
%% @author qingxuan
%%----------------------------------------------------
-module(skill_script_10390).
-export([
    handle_active/3
]).
-include("common.hrl").
-include("attr.hrl").
-include("role.hrl").
-include("combat.hrl").
-include("skill.hrl").
-include("skill_script.hrl").

handle_active(Skill = #c_skill{args = [ThpRatio, BaseVal, DmgRatio, ShpRatio, HpCostRatio], other_cost = OtherCost}, Self = #fighter{hp_max = ShpMax, hp = Shp, attr = #attr{dmg_min = DmgMin, dmg_max = DmgMax}}, Target = #fighter{hp_max = ThpMax, hp = Thp}) ->
    Avg = (DmgMin + DmgMax) /2,
    DmgAverage = case Avg > 22000 of
        true -> 22000 + (Avg-22000)/8;
        false -> Avg
    end,
    ActionEffectFunc = case Thp < ThpMax * ThpRatio / 100 of
        true ->
            Rat = BaseVal + DmgAverage * DmgRatio,
            DmgRatio1 = case Rat > 240 of
                true -> 3.4;
                false -> 1 + (BaseVal + DmgAverage * DmgRatio)/100
            end,
            #action_effect_func{dmg_adjust = fun([Dmg]) -> round(Dmg * DmgRatio1) end};
        false ->
            #action_effect_func{}
    end,
    OtherCost1 = case Shp >= ShpMax * ShpRatio /100 of
        true ->
            CostHp = util:check_range(round(ShpMax*HpCostRatio/100), 0, Shp-1),
            [{hp, CostHp}|lists:keydelete(hp, 1, OtherCost)];
        false ->
            OtherCost
    end,
    ?parent:attack(Skill#c_skill{other_cost = OtherCost1}, Self, Target, ActionEffectFunc);

handle_active(Skill, Self, Target) ->
    ?parent:attack(Skill, Self, Target).

