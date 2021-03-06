%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. 五月 2017 14:49
%%%-------------------------------------------------------------------
-module(cross_flower_proc).
-author("Administrator").

%% API
-behaviour(gen_server).

-include("common.hrl").
-include("activity.hrl").
%% gen_server callbacks
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

-define(SERVER, ?MODULE).

%% API
-export([
    start_link/0
    , get_server_pid/0
    , end_reward/0
    , cmd_refresh/0
    , cmd_refresh_nodb/0
    , test/0
]).

%%创建
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

end_reward() ->
    get_server_pid() ! end_reward.

test() ->
    get_server_pid() ! test.

cmd_refresh() ->
    get_server_pid() ! refresh_rank.

cmd_refresh_nodb() ->
    get_server_pid() ! refresh_rank_nodb.

%%获取进程PID
get_server_pid() ->
    case get(?MODULE) of
        Pid when is_pid(Pid) ->
            Pid;
        _ ->
            case misc:whereis_name(local, ?MODULE) of
                Pid when is_pid(Pid) ->
                    put(?MODULE, Pid),
                    Pid;
                _ ->
                    undefined
            end
    end.

init([]) ->
    process_flag(trap_exit, true),
%%     activity_area_group:init_area_group(data_cross_flower,cross_flower),
%%     LogList = cross_flower_load:init(),
%%     RankGiveList = cross_flower_load:rank_give_list(LogList),
%%     RankGetList = cross_flower_load:rank_get_list(LogList),
%%     {ok, #st_cross_flower{log_list = LogList, rank_give_list = RankGiveList, rank_get_list = RankGetList}}.
    {ok, #st_cross_flower{}}.


handle_call(Request, From, State) ->
    case catch cross_flower_handle:handle_call(Request, From, State) of
        {reply, Reply, NewState} ->
            {reply, Reply, NewState};
        Reason ->
            ?ERR("cross flower handle_call ~p/~p~n", [Request, Reason]),
            {reply, error, State}
    end.

handle_cast(Request, State) ->
    %%?DEBUG("hand_cast ~n"),
    case catch cross_flower_handle:handle_cast(Request, State) of
        {noreply, NewState} ->
            {noreply, NewState};
        Reason ->
            ?ERR("cross flower handle_cast ~p/ ~p~n", [Request, Reason]),
            {noreply, State}
    end.

handle_info(Request, State) ->
    case catch cross_flower_handle:handle_info(Request, State) of
        {noreply, NewState} ->
            {noreply, NewState};
        Reason ->
            ?ERR("cross flower handle_info ~p/~p~n", [Request, Reason]),
            {noreply, State}
    end.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
