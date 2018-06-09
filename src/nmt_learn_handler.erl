%%%-------------------------------------------------------------------
%%% @author ahmetturk
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. Jun 2018 20:14
%%%-------------------------------------------------------------------
-module(nmt_learn_handler).
-author("ahmetturk").

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

init(_Transport, Req, []) ->
  {ok, Req, undefined}.

handle(Req, State) ->
  {Method, Req} = cowboy_req:method(Req),
  {Echo, Req} = cowboy_req:qs_val(<<"echo">>, Req),
  {ok, Req} = echo(Method, Echo, Req),
  {ok, Req, State}.

echo(<<"GET">>, Echo, Req) ->
  cowboy_req:reply(
    200,
    [
      {<<"content-type">>, <<"application/json; charset=utf-8">>}
    ],
    Echo,
    Req
  );
echo(_, _, Req) ->
  cowboy_req:reply(405, Req).

terminate(_Reason, _Req, _State) ->
  ok.
