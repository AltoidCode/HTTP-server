const std = @import("std");
const os = std.os;

pub fn main() void {
    var listener = try os.net.StreamServer.listen(.{}, 8080);
    while (true) {
        var conn = try listener.accept();
        const response = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\nHello, World!";
        try conn.writer().writeAll(response);
        try conn.close();
    }
}
