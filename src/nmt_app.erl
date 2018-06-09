-module(nmt_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
	Dispatch = cowboy_router:compile([
		{
			'_', [
			{"/learn", nmt_learn_handler, []}
		]}
	]),
	{ok, _} = cowboy:start_http(http, 100, [{port, 3131}], [{env, [{dispatch, Dispatch}]}]),
	nmt_sup:start_link().

stop(_State) ->
	ok.
