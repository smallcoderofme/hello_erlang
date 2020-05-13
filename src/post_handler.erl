-module(post_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
	PostId = cowboy_req:binding(post_id, Req0, 666),
	#{key1 := Key1, key2 := Key2} = cowboy_req:match_qs([key1, key2], Req0),
	% #{post_id := PostId} = cowboy_req:match_qs([post_id], Req0),
	io:format("post handler params : ~w, query key1: ~w key2: ~w ~n", [PostId, binary_to_list(Key1), binary_to_list(Key2)]),
	Req = cowboy_req:reply(200,
		#{<<"content-type">>=><<"text/plain">>},
		<<"Post View">>,
		Req0),
	{ok, Req, State}.
