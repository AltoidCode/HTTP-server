using Soup;

public class HelloWorldServer : Soup.Server {
    public HelloWorldServer() {
        this.add_handler("/", this.on_hello_world);
    }

    private void on_hello_world(Soup.Message message) {
        message.response_headers.set_content_type("text/plain", null);
        message.set_status(Soup.Status.OK);
        message.response_body.append("Hello, World!");
    }

    public static int main(string[] args) {
        var server = new HelloWorldServer();
        server.listen("localhost", 8080);
        stdout.printf("Server running at http://localhost:8080/\n");
        server.run();
    }
}
