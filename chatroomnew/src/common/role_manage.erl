%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%  登录玩家管理
%%% @end
%%% Created : 10. 五月 2018 15:25
%%%-------------------------------------------------------------------
-module(role_manage).
-author("Administrator").

-behaviour(gen_server).
%% API
-export([start_link/0,init/1,bindsocket/1]).
-export([handle_info/2,handle_cast/2,handle_call/3,terminate/2,code_change/3]).

-record(clientinfo,{pid,socket}).

start_link()->
    gen_server:start_link({local,?MODULE}, ?MODULE, [],[]).

%% 创建一个ets,保存所有登录玩家的数据
init([])->
%%    创建一个ets表保存进入房间的信息
%%    {ok,ets:new(roleinfo,[set,protected])}.
    {ok,ets:new(clientinfo,[set,public,named_table,{keypos,#clientinfo.pid}])}.


%% 根据Id开启一个客户端的进程信息，此ID可以标识为房间号id
handle_call({getpid},From,State)->
    {ok,Pid}= role_socket:start_link(),
    io:format("new pid is create,~p~n",[Pid]),
    {reply,Pid,State};

%% 根据pid来删除数据
handle_call({remove_clientinfo,Ref},From,State)->
    Key=Ref#clientinfo.pid,
    ets:delete(clientinfo, Key).

%%process messages
handle_info(Request,State)->
    {noreply,State}.

handle_cast(_From,State)->
    {noreply,State}.

terminate(_Reason,_State)->
    ok.

code_change(_OldVersion,State,Ext)->
    {ok,State}.


%% 绑定socket连接
bindsocket(Socket) ->
    Pid = gen_server:call(?MODULE,{getpid}),
    case gen_tcp:controlling_process(Socket,Pid) of
        {error,Reason}->
            io:format("binding socket...error~n");
        ok ->
            NewRec =#clientinfo{socket=Socket,pid=Pid},
            io:format("chat_room:insert record ~p~n",[NewRec]),
            ets:insert(clientinfo,NewRec),
            Pid!{bind,Socket},
            io:format("clientBinded~n")
    end.