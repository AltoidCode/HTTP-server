#include "crow_all.h"

int main()
{
    crow::SimpleApp app;

    CROW_ROUTE(app, "/")
    ([](){
        return "simple server";
    });

    app.port(8000).multithreaded().run();
}
