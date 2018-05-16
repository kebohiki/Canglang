%%%---------------------------------------
	%%% @Author  : 苍狼工作室
	%%% @Module  : data_guild_boss
	%%% @Created : 2018-03-05 23:13:14
	%%% @Description:  自动生成
	%%%---------------------------------------
-module(data_guild_boss).
-export([get/1]).
-export([get/2]).
-export([get_max/0]).
-include("guild.hrl").

    get_max() ->10.
get(1,Glv) when Glv >= 1 andalso Glv =< 3 -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 1 ,exp = 31200 ,mon_id = 56201 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,10}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(2,Glv) when Glv >= 1 andalso Glv =< 3 -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 2 ,exp = 64800 ,mon_id = 56202 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,12}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(3,Glv) when Glv >= 1 andalso Glv =< 3 -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 3 ,exp = 134400 ,mon_id = 56203 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,14}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(4,Glv) when Glv >= 1 andalso Glv =< 3 -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 4 ,exp = 278400 ,mon_id = 56204 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,16}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(5,Glv) when Glv >= 1 andalso Glv =< 3 -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 5 ,exp = 576000 ,mon_id = 56205 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,18}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(6,Glv) when Glv >= 1 andalso Glv =< 3 -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 6 ,exp = 1190400 ,mon_id = 56206 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,20}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(7,Glv) when Glv >= 1 andalso Glv =< 3 -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 7 ,exp = 1228800 ,mon_id = 56207 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,22}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(8,Glv) when Glv >= 1 andalso Glv =< 3 -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 8 ,exp = 1267200 ,mon_id = 56208 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,24}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(9,Glv) when Glv >= 1 andalso Glv =< 3 -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 9 ,exp = 1344000 ,mon_id = 56209 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,26}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(10,Glv) when Glv >= 1 andalso Glv =< 3 -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 10 ,exp = 0 ,mon_id = 56210 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,28}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(1,Glv) when Glv >= 4 andalso Glv =< 10 -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 1 ,exp = 31200 ,mon_id = 56211 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,10}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(2,Glv) when Glv >= 4 andalso Glv =< 10 -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 2 ,exp = 64800 ,mon_id = 56212 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,12}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(3,Glv) when Glv >= 4 andalso Glv =< 10 -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 3 ,exp = 134400 ,mon_id = 56213 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,14}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(4,Glv) when Glv >= 4 andalso Glv =< 10 -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 4 ,exp = 278400 ,mon_id = 56214 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,16}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(5,Glv) when Glv >= 4 andalso Glv =< 10 -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 5 ,exp = 576000 ,mon_id = 56215 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,18}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(6,Glv) when Glv >= 4 andalso Glv =< 10 -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 6 ,exp = 1190400 ,mon_id = 56216 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,20}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(7,Glv) when Glv >= 4 andalso Glv =< 10 -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 7 ,exp = 1228800 ,mon_id = 56217 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,22}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(8,Glv) when Glv >= 4 andalso Glv =< 10 -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 8 ,exp = 1267200 ,mon_id = 56218 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,24}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(9,Glv) when Glv >= 4 andalso Glv =< 10 -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 9 ,exp = 1344000 ,mon_id = 56219 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,26}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(10,Glv) when Glv >= 4 andalso Glv =< 10 -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 10 ,exp = 0 ,mon_id = 56220 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,28}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(_,_) -> [].
get(56201) -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 1 ,exp = 31200 ,mon_id = 56201 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,10}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56202) -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 2 ,exp = 64800 ,mon_id = 56202 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,12}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56203) -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 3 ,exp = 134400 ,mon_id = 56203 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,14}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56204) -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 4 ,exp = 278400 ,mon_id = 56204 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,16}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56205) -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 5 ,exp = 576000 ,mon_id = 56205 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,18}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56206) -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 6 ,exp = 1190400 ,mon_id = 56206 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,20}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56207) -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 7 ,exp = 1228800 ,mon_id = 56207 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,22}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56208) -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 8 ,exp = 1267200 ,mon_id = 56208 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,24}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56209) -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 9 ,exp = 1344000 ,mon_id = 56209 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,26}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56210) -> #guild_boss{guild_lv_up = 1 ,guild_lv_down = 3 ,star = 10 ,exp = 0 ,mon_id = 56210 ,sp_call_cost = 50 ,sp_call_reward = [{7750002,28}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56211) -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 1 ,exp = 31200 ,mon_id = 56211 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,10}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56212) -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 2 ,exp = 64800 ,mon_id = 56212 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,12}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56213) -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 3 ,exp = 134400 ,mon_id = 56213 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,14}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56214) -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 4 ,exp = 278400 ,mon_id = 56214 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,16}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56215) -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 5 ,exp = 576000 ,mon_id = 56215 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,18}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56216) -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 6 ,exp = 1190400 ,mon_id = 56216 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,20}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56217) -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 7 ,exp = 1228800 ,mon_id = 56217 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,22}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56218) -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 8 ,exp = 1267200 ,mon_id = 56218 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,24}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56219) -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 9 ,exp = 1344000 ,mon_id = 56219 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,26}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(56220) -> #guild_boss{guild_lv_up = 4 ,guild_lv_down = 10 ,star = 10 ,exp = 0 ,mon_id = 56220 ,sp_call_cost = 100 ,sp_call_reward = [{7750002,28}] ,rank_list = [{1,1,[{7750002,10}]},{2,3,[{7750002,8}]},{4,10,[{7750002,6}]},{11,999,[{7750002,4}]}] ,kill_reward = [{7750002,10}]};
get(_) -> [].