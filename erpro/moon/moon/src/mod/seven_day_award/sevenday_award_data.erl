
-module(sevenday_award_data).
-export([
		get/1
    ]).

get({1,1}) -> [{item,[535605,1,1]},{item,[221104,1,2]},{item,[221103,1,5]},{item,[532523,1,5]}];
get({1,2}) -> [{item,[535605,1,1]},{item,[111012,1,1]},{item,[221103,1,5]},{item,[532523,1,5]}];
get({1,3}) -> [{item,[535605,1,1]},{item,[111002,1,2]},{item,[221103,1,8]},{item,[532523,1,8]}];
get({1,4}) -> [{item,[535605,1,1]},{item,[535603,1,3]},{item,[532523,1,8]},{item,[221105,1,10]}];
get({1,5}) -> [{item,[535605,1,2]},{item,[111502,1,1]},{item,[532523,1,10]},{item,[131001,1,5]}];
get({1,6}) -> [{item,[535605,1,2]},{item,[535603,1,1]},{item,[532523,1,10]},{item,[131001,1,5]}];
get({1,7}) -> [{item,[535605,1,2]},{item,[111503,1,1]},{item,[532523,1,15]},{item,[111701,1,1]}];
get({2,1}) -> [{item,[221001,1,5]},{item,[221105,1,6]}];
get({2,2}) -> [{item,[221001,1,5]},{item,[221104,1,5]}];
get({2,3}) -> [{item,[221001,1,5]},{item,[201001,1,5]}];
get({2,4}) -> [{item,[221001,1,5]},{item,[621501,1,2]}];
get({2,5}) -> [{item,[221001,1,5]},{item,[221103,1,5]}];
get({2,6}) -> [{item,[221001,1,8]},{item,[221102,1,8]}];
get({2,7}) -> [{item,[221001,1,10]},{item,[621502,1,2]}];
get(_Id) -> false.


