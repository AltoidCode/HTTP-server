use hyper::{Request, Response, Server, Body, Method};
use hyper::service::{make_service_fn, service_fn};

async fn handle_request(req: Request<Body>) -> Result<Response<Body>, hyper::Error> {
    let response = "Simple server in rust";
    Ok(Response::new(Body::from(response)))
}

#[tokio::main]
async fn main() {
    let make_svc = make_service_fn(|_conn| async {
        Ok::<_, hyper::Error>(service_fn(handle_request))
    });

    let addr = ([127, 0, 0, 1], 8000).into();
    let server = Server::bind(&addr).serve(make_svc);

    println!("Server running on http://localhost:8000");
    if let Err(e) = server.await {
        eprintln!("Server error: {}", e);
    }
}
