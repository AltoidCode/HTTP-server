open Suave

let app = 
    choose [
        GET >=> path "/" >=> OK "Simple server in f-sharp"
    ]

startWebServer defaultConfig app
