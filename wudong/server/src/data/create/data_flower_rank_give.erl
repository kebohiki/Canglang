%%%---------------------------------------
	%%% @Author  : 苍狼工作室
	%%% @Module  : data_flower_rank_give
	%%% @Created : 2017-08-04 17:31:27
	%%% @Description:  自动生成
	%%%---------------------------------------
-module(data_flower_rank_give).
-export([get/1]).
-export([get_des/1]).
-include("common.hrl").
get(Rank)when Rank>= 1 andalso Rank =< 1->{{6603040,1},{6609007,1},{20340,30},{1010005,30}};
get(Rank)when Rank>= 2 andalso Rank =< 2->{{6609007,1},{20340,25},{1010005,25}};
get(Rank)when Rank>= 3 andalso Rank =< 3->{{6609007,1},{20340,20},{1010005,20}};
get(Rank)when Rank>= 4 andalso Rank =< 10->{{5101403,1},{20340,15},{1010005,15}};
get(Rank)when Rank>= 11 andalso Rank =< 20->{{5101423,1},{20340,10},{1010005,10}};
get(Rank)when Rank>= 21 andalso Rank =< 50->{{5101413,1},{20340,8},{1010005,8}};
get(Rank)when Rank>= 51 andalso Rank =< 100->{{5101402,1},{20340,5},{1010005,5}};
get(_) -> [].
get_des(Rank) when Rank >=1 andalso Rank =< 1->1;
get_des(Rank) when Rank >=2 andalso Rank =< 2->2;
get_des(Rank) when Rank >=3 andalso Rank =< 3->3;
get_des(Rank) when Rank >=4 andalso Rank =< 10->4;
get_des(Rank) when Rank >=11 andalso Rank =< 20->5;
get_des(Rank) when Rank >=21 andalso Rank =< 50->6;
get_des(Rank) when Rank >=51 andalso Rank =< 100->7;
get_des(_) -> [].
