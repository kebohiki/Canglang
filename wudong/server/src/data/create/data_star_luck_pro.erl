%%%---------------------------------------
	%%% @Author  : 苍狼工作室
	%%% @Module  : data_star_luck_pro
	%%% @Created : 2016-06-20 21:27:33
	%%% @Description:  自动生成
	%%%---------------------------------------
-module(data_star_luck_pro).
-export([get/1]).
-include("star_luck.hrl").
  get(1) -> #base_star_luck_pro{ type=1,goods_list=[{46002,1000},{46007,1000},{46012,1000},{46017,1000},{46022,1000},{46027,1000},{46032,0},{46037,0},{46042,0}] };
  get(2) -> #base_star_luck_pro{ type=2,goods_list=[{46002,580},{46007,580},{46012,580},{46017,580},{46022,580},{46027,580},{46032,0},{46037,0},{46042,0},{46003,420},{46008,420},{46013,420},{46018,420},{46023,420},{46028,420},{46033,0},{46038,0},{46043,0}] };
  get(3) -> #base_star_luck_pro{ type=3,goods_list=[{46002,200},{46007,200},{46012,200},{46017,200},{46022,200},{46027,200},{46032,0},{46037,0},{46042,0},{46003,750},{46008,750},{46013,750},{46018,750},{46023,750},{46028,750},{46033,0},{46038,0},{46043,0},{46004,50},{46009,50},{46014,50},{46019,50},{46024,50},{46029,50},{46034,0},{46039,0},{46044,0}] };
  get(4) -> #base_star_luck_pro{ type=4,goods_list=[{46003,200},{46008,350},{46013,350},{46018,350},{46023,350},{46028,350},{46033,0},{46038,0},{46043,0},{46004,300},{46009,750},{46014,750},{46019,750},{46024,750},{46029,750},{46034,0},{46039,0},{46044,750}] };
  get(5) -> #base_star_luck_pro{ type=5,goods_list=[{46004,400},{46009,800},{46014,800},{46019,800},{46024,800},{46029,800},{46034,0},{46039,0},{46044,800},{46005,150},{46010,350},{46015,350},{46020,350},{46025,350},{46030,350},{46035,200},{46040,350},{46045,300}] };
get(_) -> [].
