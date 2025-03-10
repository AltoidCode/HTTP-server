require "http/server"

server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"
  context.response.print "Hello, World!"
end

server.bind_tcp("0.0.0.0", 8080)
puts "Server running at http://localhost:8080/"
server.listen
