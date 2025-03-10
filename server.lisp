(defpackage :simple-http-server
  (:use :cl :usocket))

(in-package :simple-http-server)

(defun handle-request (stream)
  (write-line "HTTP/1.1 200 OK" stream)
  (write-line "Content-Type: text/plain" stream)
  (write-line "" stream)
  (write-line "Hello, World!" stream))

(defun start-server ()
  (let ((server (make-server :host "localhost" :port 8080)))
    (loop
      (let ((client (accept-connection server)))
        (handle-request client)
        (close client)))))

(start-server)
