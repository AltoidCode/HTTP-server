(ns simple-server.core
  (:require [ring.adapter.jetty :as jetty]
            [ring.util.response :refer [response]]))

(defn hello-world [request]
  (response "Hello, World!"))

(def app
  (fn [request]
    (hello-world request)))

(defn -main []
  (jetty/run-jetty app {:port 8080}))
