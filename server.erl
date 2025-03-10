-module(simple_http_server).
-compile([export_all]).

start() ->
    {ok, _Socket} = gen_tcp:listen(8080, [binary, {packet, 0}, {active, false}, {reuseaddr, true}]),
    loop().

loop() ->
    {ok, Socket} = gen_tcp:accept(8080),
    gen_tcp:send(Socket, "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\nHello, World!"),
    gen_tcp:close(Socket),
    loop().
