open Cohttp
open Cohttp_lwt_unix

let callback _conn _req _body =
  let body = "Hello, World!" in
  Server.respond_string ~status:`OK ~body ()

let () =
  let server = Server.make ~callback () in
  let _ = Server.create ~mode:(`TCP (`Port 8080)) server in
  Printf.printf "Server running at http://localhost:8080/\n";
  Lwt_main.run (Lwt.return ())
