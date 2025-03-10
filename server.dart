import 'package:shelf/shelf.dart';
import 'package:shelf/io.dart';

Response _echoRequest(Request request) =>
    Response.ok('Hello, World!');

void main() {
  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(_echoRequest);

  serve(handler, 'localhost', 8080);
  print('Server running at http://localhost:8080/');
}
