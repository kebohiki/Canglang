
-module(guagua_data).
-export([
        get/1
    ]
).


get(532523) ->[{3000,[221104,1,3],0},{1000,[221105,1,2],0},{500,[201001,1,1],2},{500,[621101,1,3],0},{2000,[611101,1,1],2},{1000,[621501,1,1],2}];
get(532525) ->[{1250,[221104,1,1],0},{1250,[221102,1,1],0},{1250,[221103,1,1],0},{1250,[131001,1,1],0},{1250,[601001,1,10],0},{1250,[111301,1,1],0},{1250,[611501,1,10],0},{1250,[231001,1,1],0}];
get(_) -> false.


