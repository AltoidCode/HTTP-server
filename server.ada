with Ada.Text_IO;
with Ada.Socket;
with Ada.Streams.Stream_IO;

procedure Simple_HTTP_Server is
   package HTTP_IO is new Ada.Streams.Stream_IO (Stream => Ada.Text_IO.File_Type);
   Server_Socket : Ada.Socket.Stream_Protocol.Socket;
   Client_Socket : Ada.Socket.Stream_Protocol.Socket;
   Accept_Address : Ada.Socket.Stream_Protocol.Address;
begin
   -- Create a socket and bind it to a port
   Ada.Socket.Stream_Protocol.Create (Server_Socket);
   Ada.Socket.Stream_Protocol.Bind (Server_Socket, 8080);
   Ada.Text_IO.Put_Line ("Server running at http://localhost:8080/");

   loop
      Ada.Socket.Stream_Protocol.Accept (Server_Socket, Client_Socket, Accept_Address);
      HTTP_IO.Put_Line ("Hello, World!");
      Ada.Socket.Stream_Protocol.Close (Client_Socket);
   end loop;
end Simple_HTTP_Server;
