import io.ktor.application.*
import io.ktor.http.*
import io.ktor.features.ContentNegotiation
import io.ktor.response.respond
import io.ktor.routing.get
import io.ktor.routing.routing
import io.ktor.server.engine.embeddedServer
import io.ktor.server.netty.Netty
import io.ktor.server.plugins.statuspages.StatusPages

fun main() {
    embeddedServer(Netty, port = 8080) {
        routing {
            get("/") {
                call.respond(HttpStatusCode.OK, "Hello, World!")
            }
        }
    }.start(wait = true)
}
