: start-server
  8080 listen
  begin
    accept
    ." Hello, World!" cr
    drop
  again ;
start-server
