%% 配置生成时间 2018-05-14 17:03:11
-module(data_jiandao_map).
-export([get/1]).
-export([get_all/0]).
-include("activity.hrl").

get(1) ->
    #base_jiandao_map{
        open_info=#open_info{gp_id = [{0,60000},{30001,50000},{8001,8500},{1001,1500},{1501,2000},{2001,2500},{2501,3000},{50001,60000},{3001,3500},{3501,4000},{5001,5500},{6001,6500},{4001,4500},{8501,9000},{9001,9500},{9501,10000},{10001,10500}],gs_id=[],open_day=0,end_day=0,start_time={{2018,04,24},{00,00,00}},end_time={{2018,04,24},{23,59,59}},limit_open_day=0,limit_end_day=0,merge_st_day=0,merge_et_day=0,merge_times_list=[],ignore_gs=[],priority=0,after_open_day=0},
        act_id=1,
        one_cost = 100,
        ten_cost = 800,
        chip_min = 13,
        chip_max = 16,
        cd_time = 3600,
        list = [{1,100,10,1000,[{40031,1,10,1},{40021,1,100,0},{40011,1,20,0},{40022,1,100,0},{40012,1,20,0},{40032,1,10,1},{40001,5,100,0},{40002,1,20,0},{40033,1,10,1},{40023,1,100,0},{40013,1,20,0},{40024,1,100,0},{40014,1,20,0},{40034,1,10,1},{40001,10,100,1},{40002,1,20,0}]}],
        act_info=#act_info{}
    };
get(_) -> [].

get_all() -> [1].