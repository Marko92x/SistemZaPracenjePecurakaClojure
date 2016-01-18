(ns mybank.service.DobavljacEndpoint
    (:use compojure.core
      ring.middleware.json
      ring.util.response)
    (:require [compojure.route :as route]
      [mybank.domain.dobavljac :as dobavljac]))

(defroutes my_routes
           (GET "/dobavljaci" [] (response (dobavljac/getDobavljac))))

