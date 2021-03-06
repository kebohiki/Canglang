%%%-------------------------------------------------------------------
%%% @author fancy
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 二月 2015 上午10:19
%%%-------------------------------------------------------------------
-module(login_aibei).
-author("fancy").
-include("common.hrl").

%% API
-export([login/0,login/1]).

login() ->
    login(["1231234"]).

login([Token]) ->
    Url = "http://121.43.227.16:8080/login.php?f=aibei",
    %%Url = "http://192.168.1.222:8000/login.php?f=aibei",
    AppId = 3002074117,
    PostData=io_lib:format("appid=~p&logintoken=~s",[AppId,Token]),
    PostData2= unicode:characters_to_list(PostData,unicode),
    case httpc:request(post,{Url,[],"application/x-www-form-urlencoded",PostData2},[],[]) of
        {ok,{_,_,Body}} ->
            ?PRINT("~s~n",[Body]),
            case rfc4627:decode(Body) of
                {ok,{obj,JSONlist},_} ->
                    case lists:keyfind("userid",1,JSONlist) of
                        {_,UserId} ->
                            {1,util:to_list(UserId)};
                        _ ->
                            %%?ERR("login 91sdk err code:~p~n",[util:to_integer(Code)]),
                            {0,false}
                    end;
                _ ->
                    {0,false}
            end;
        _ ->
            {0,false}
    end.
