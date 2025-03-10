using HTTP

function request_handler(req)
    return HTTP.Response(200, "Hello, World!")
end

HTTP.serve(request_handler, "0.0.0.0", 8080)
