import haxe.Http;

class Main {
    static function main() {
        var server = new Http("http://localhost:8080");
        server.onData = function(data) {
            trace(data);
        };
        server.request(true);
    }
}
