library(httpuv)

server <- function(req) {
  list(
    status = 200L,
    headers = list('Content-Type' = 'text/plain'),
    body = "Hello, World!"
  )
}

httpuv::runServer("0.0.0.0", 8080, list(call = server))
