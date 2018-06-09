%%%-------------------------------------------------------------------
%%% @author ahmetturk
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. Jun 2018 23:51
%%%-------------------------------------------------------------------
-module(nmt_ets).
-author("ahmetturk").

-behavior(gen_server).

-record(state, {

}).

%% API
-export([start/0, init/1, handle_call/3, handle_cast/2]).

start() ->
  gen_server:start_link(?MODULE, [], []).

init([]) ->
  {ok, []}.

handle_call(Request, From, State) ->
  erlang:error(not_implemented).

handle_cast(Request, State) ->
  erlang:error(not_implemented).
