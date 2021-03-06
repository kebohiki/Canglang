%%%-------------------------------------------------------------------
%%% @author hxming
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 二月 2016 15:30
%%%-------------------------------------------------------------------
-module(grace_proc).
-author("hxming").

%% API
-behaviour(gen_server).

-include("grace.hrl").
-include("common.hrl").


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
    , set_timer/2
    , cmd_start/0
    , cmd_close/0
    , cmd_reset/0
]).

%%创建
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).


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


cmd_start() ->
    [Start, End] = hd(time_list()),
    get_server_pid() ! {ready, 5, End - Start},
    ok.
cmd_close() ->
    get_server_pid() ! close,
    ok.
cmd_reset() ->
    get_server_pid() ! {reset, util:unixtime()},
    ok.

init([]) ->
    State = set_timer(#st_grace{}, util:unixtime()),
    {ok, State}.



handle_call(Request, From, State) ->
    case catch grace_handle:handle_call(Request, From, State) of
        {reply, Reply, NewState} ->
            {reply, Reply, NewState};
        Reason ->
            ?ERR("grace handle_call ~p~n", [Reason]),
            {reply, error, State}
    end.


handle_cast(Request, State) ->
    case catch grace_handle:handle_cast(Request, State) of
        {noreply, NewState} ->
            {noreply, NewState};
        Reason ->
            ?ERR("grace handle_cast ~p~n", [Reason]),
            {noreply, State}
    end.

handle_info(Request, State) ->
    case catch grace_handle:handle_info(Request, State) of
        {noreply, NewState} ->
            {noreply, NewState};
        Reason ->
            ?ERR("grace handle_info ~p~n", [Reason]),
            {noreply, State}
    end.

terminate(_Reason, _State) ->
    ok.


code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
set_timer(StGrace, Now) ->
    NowSec = util:get_seconds_from_midnight(Now),
    case time_list() of
        [] ->
            #st_grace{open_state = ?GRACE_STATE_CLOSE};
        TimeList ->
            case [{S, E - S} || [S, E] <- TimeList, S > NowSec] of
                [] ->
                    Time = hd(hd(TimeList)),
                    StGrace#st_grace{open_state = ?GRACE_STATE_CLOSE, time = Now + ?ONE_DAY_SECONDS - NowSec + Time, is_today = false, next_time = Time};
                NewTimeList ->
                    {StartTime, LastTime} = hd(NewTimeList),
                    ReadyTime = StartTime - ?GRACE_READY_TIME,
                    if NowSec < ReadyTime ->
                        Ref = erlang:send_after((ReadyTime - NowSec) * 1000, self(), {ready, ?GRACE_READY_TIME, LastTime}),
                        StGrace#st_grace{open_state = ?GRACE_STATE_CLOSE, time = Now + ReadyTime - NowSec, ref = Ref, is_today = true, next_time = StartTime};
                        true ->
                            Ref = erlang:send_after((StartTime - NowSec) * 1000, self(), {start, LastTime}),
                            StGrace#st_grace{open_state = ?GRACE_STATE_READY, ref = Ref, time = Now + StartTime - NowSec, is_today = true, next_time = StartTime}
                    end
            end
    end.

time_list() ->
    F = fun(Id) ->
        [H * 3600 + M * 60 || {H, M} <- data_grace_time:get(Id)]
        end,
    lists:map(F, data_grace_time:ids()).
