#lang racket

(require web-server/servlet)

(define (start request)
  (response/xexpr '(html (body (h1 "Hello, World!")))))

(serve/servlet start)
