%%%---------------------------------------
	%%% @Author  : 苍狼工作室
	%%% @Module  : data_red_bag_random
	%%% @Created : 2017-07-11 10:05:55
	%%% @Description:  自动生成
	%%%---------------------------------------
-module(data_red_bag_random).
-export([get/1]).
-include("red_bag.hrl").
  get(1) -> [{1,40},{2,30},{3,20},{4,10},{5,5},{6,1}];
  get(2) -> [{1,10},{2,15},{3,30},{4,30},{5,30},{6,20},{7,15},{8,10},{9,5},{10,4}];
  get(3) -> [{1,10},{2,15},{3,30},{4,30},{5,30},{6,20},{7,15},{8,10},{9,5},{10,4}];
  get(4) -> [{1,10},{2,15},{3,15},{4,20},{5,30},{6,30},{7,20},{8,15},{9,10},{10,5},{11,4},{12,1}];
  get(5) -> [{1,10},{2,15},{3,20},{4,30},{5,30},{6,30},{7,30},{8,20},{9,15},{10,10},{11,5},{12,4},{13,1}];
  get(6) -> [{1,10},{2,15},{3,15},{4,20},{5,20},{6,30},{7,30},{8,30},{9,20},{10,15},{11,10},{12,5},{13,4},{14,1}];
  get(7) -> [{1,1},{2,15},{3,20},{4,20},{5,25},{6,25},{7,30},{8,30},{9,20},{10,20},{11,15},{12,10},{13,5},{14,4},{15,1},{16,1}];
  get(8) -> [{1,1},{2,15},{3,20},{4,20},{5,25},{6,25},{7,30},{8,30},{9,20},{10,20},{11,15},{12,10},{13,5},{14,4},{15,1},{16,1},{17,1},{18,1}];
  get(9) -> [{1,1},{2,15},{3,20},{4,20},{5,25},{6,25},{7,30},{8,30},{9,20},{10,20},{11,15},{12,10},{13,5},{14,4},{15,1},{16,1},{17,1},{18,1},{19,1},{20,1}];
get(_) -> [].
