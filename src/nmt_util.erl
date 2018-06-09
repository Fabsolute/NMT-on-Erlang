%%%-------------------------------------------------------------------
%%% @author ahmetturk
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Jun 2018 00:37
%%%-------------------------------------------------------------------
-module(nmt_util).
-author("ahmetturk").

%% API
-export([replace/3, tokenize/1, preprocess/1]).

replace([], [], Text) ->
  Text;
replace([HInput | TInput] = Input, [HOutput | TOutput] = Output, Text) when length(Input) == length(Output) ->
  replace(
    TInput,
    TOutput,
    string:replace(Text, HInput, HOutput)
  ).

tokenize(Text) ->
  [string:trim(X) || X <- string:split(replace([".", "!", "?"], ["", "", ""], Text), " ")].

preprocess(Text) ->
  replace(
    ["'ll", "&apos;", "&quot;", ","],
    [" will", "", "", ""],
    Text
  ).
