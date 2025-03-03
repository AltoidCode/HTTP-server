package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Simple server in go")
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Server started at http://localhost:8000")
	http.ListenAndServe(":8000", nil)
}
