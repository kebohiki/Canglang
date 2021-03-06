%%%---------------------------------------
	%%% @Author  : 苍狼工作室
	%%% @Module  : data_act_festive_boss_pose
	%%% @Created : 2017-10-24 20:39:47
	%%% @Description:  自动生成
	%%%---------------------------------------
-module(data_act_festive_boss_pose).
-export([get/1,ids/0]).
-include("activity.hrl").
-include("common.hrl").
get(10003) -> 
   #base_act_festive_boss_pos{scene_id = 10003 ,pos = [{61,79},{53,90},{52,110},{14,105},{7,74},{28,81},{45,58},{27,60},{50,38},{70,22},{80,37},{27,10},{10,12},{35,75},{85,70},{58,50},{4,43},{10,36},{26,90},{83,59},{65,9},{37,9},{33,17},{72,47},{47,71},{61,55},{5,118},{3,58},{15,46},{17,38},{36,20},{6,103},{27,98},{41,89},{58,110},{30,55}]};
get(10004) -> 
   #base_act_festive_boss_pos{scene_id = 10004 ,pos = [{19,123},{6,100},{32,88},{53,99},{77,46},{23,65},{19,38},{48,29},{59,41},{47,123},{77,102},{17,73},{5,64},{60,6},{57,28},{47,24},{78,55},{47,71},{15,110},{28,93},{75,63},{10,27},{63,4},{57,3},{27,24},{55,64},{69,122}]};
get(10007) -> 
   #base_act_festive_boss_pos{scene_id = 10007 ,pos = [{13,13},{7,21},{3,34},{7,48},{12,58},{18,78},{30,68},{34,89},{26,101},{10,96},{14,102},{17,112},{26,116},{18,138},{34,125},{38,133},{30,156},{38,162},{45,164},{30,195},{23,199},{18,196},{14,188},{22,168},{11,159},{56,199},{63,197},{70,180},{68,198},{77,160},{99,197},{117,178},{111,189},{113,133},{105,126},{98,130},{110,109},{96,102},{114,84},{104,77},{98,64},{84,61},{74,59},{59,60},{51,52},{58,43},{70,50},{80,40},{89,45},{118,18},{100,22},{65,148},{65,127},{70,106},{77,97}]};
get(10008) -> 
   #base_act_festive_boss_pos{scene_id = 10008 ,pos = [{11,25},{6,29},{9,33},{5,33},{19,58},{9,74},{34,57},{36,79},{24,82},{22,93},{5,101},{15,101},{32,99},{41,94},{44,86},{63,93},{60,77},{63,71},{50,59},{62,50},{56,47},{52,46},{74,47},{59,36},{48,23},{40,30},{31,35},{25,34},{27,11},{22,29},{19,31},{19,41}]};
get(13003) -> 
   #base_act_festive_boss_pos{scene_id = 13003 ,pos = [{3,124},{7,118},{5,109},{31,104},{47,114},{22,88},{32,80},{43,72},{40,95},{56,92},{64,79},{64,69},{77,97},{83,101},{80,58},{76,46},{68,55},{59,44},{43,30},{58,30},{43,47},{34,54},{24,41},{29,67},{8,27},{30,32},{54,75},{51,59}]};
get(_) -> [].


ids() -> [10003,10004,10007,10008,13003].