import NIO
import NIOHTTP1

let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
defer {
    try! group.syncShutdownGracefully()
}

let bootstrap = ServerBootstrap(group: group)
    .childChannelInitializer { channel in
        channel.pipeline.addHandler(HTTPHandler())
    }
    .bind(host: "localhost", port: 8080)

let channel = try! bootstrap.wait()
print("Server started at \(channel.localAddress!)")

try! channel.closeFuture.wait()

final class HTTPHandler: ChannelInboundHandler {
    typealias InboundIn = HTTPServerRequestPart
    typealias OutboundOut = HTTPServerResponsePart

    func channelRead(ctx: ChannelHandlerContext, data: NIOAny) {
        let requestPart = self.unwrapInboundIn(data)
        switch requestPart {
        case .head(let header):
            if header.method == .GET {
                var response = HTTPResponseHead(version: .http1_1, status: .ok)
                response.headers.add(name: "Content-Type", value: "text/plain")
                ctx.write(self.wrapOutboundOut(.head(response)), promise: nil)
                ctx.write(self.wrapOutboundOut(.body(.byteBuffer(ByteBuffer(string: "Simple server in swift")))), promise: nil)
                ctx.write(self.wrapOutboundOut(.end(nil)), promise: nil)
            }
        default:
            break
        }
    }
}
