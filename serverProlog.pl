:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_server)).

hello_world(Request) :-
    format('Content-type: text/plain~n~n'),
    format('Hello, World!').

server(8080) :-
    http_server(http_dispatch, [port(8080)]).

:- initialization(server(8080)).
