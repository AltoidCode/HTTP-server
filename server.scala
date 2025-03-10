import akka.actor.ActorSystem
import akka.http.scaladsl.Http
import akka.http.scaladsl.server.Directives._
import akka.stream.ActorMaterializer

object SimpleHttpServer extends App {
  implicit val system = ActorSystem()
  implicit val materializer = ActorMaterializer()

  val route = pathSingleSlash {
    complete("Hello, World!")
  }

  Http().bindAndHandle(route, "localhost", 8080)
}
