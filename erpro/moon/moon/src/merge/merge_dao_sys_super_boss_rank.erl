%%---------------------------------------------------
%% @doc 超级boss排行榜
%% 
%% @author yqhuang(QQ:19123767)
%% @end
%%----------------------------------------------------
-module(merge_dao_sys_super_boss_rank).

-export([
        do_init/1
        ,do_convert/2
        ,do_end/1
    ]
).

-include("common.hrl").
-include("merge.hrl").

do_init(Table) ->
    {ok, [], Table}.

%% 处理数据
do_convert(_Data, Table) -> {ok, Table}.

%% 最后执行一下,释放资源
do_end(_Table) -> ignore.
