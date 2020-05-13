-module(hello_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
	Req = cowboy_req:reply(200,
		#{<<"content-type">>=><<"text/plain">>},
		<<"Hello Triaver">>,
		Req0),
	#{method := Method} = Req,
	#{version := Version} = Req,
	io:format("hello method:~w, version ~w. ~n", [Method, Version]),
	{ok, Req, State}.
