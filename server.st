Object subclass: SimpleHTTPServer [
    SimpleHTTPServer class >> start [
        | server |
        server := HTTPServer new.
        server port: 8080.
        server start.
    ]
]

SimpleHTTPServer start.
