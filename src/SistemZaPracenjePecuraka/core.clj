(ns SistemZaPracenjePecuraka.core
    (:use compojure.core
      ring.middleware.json
      ring.util.response)
    (:require [compojure.route :as route]
              [SistemZaPracenjePecuraka.domain.dobavljac :as dobavljac]
              [SistemZaPracenjePecuraka.domain.zaduzenje :as zaduzenje]
              [SistemZaPracenjePecuraka.domain.dnevnaberba :as dnevnaberba]
              [SistemZaPracenjePecuraka.domain.stavkadnevneberbe :as stavka]
              [SistemZaPracenjePecuraka.controller.controller :as con])
              )

(defroutes my_routes

           (GET "/" [] (con/index))
           (GET "/index.html" [] (con/index))
           (GET "/radi.html" [] (con/radi))
           (GET "/dnevne-berbe.html" [] (con/dnevneberbe))
           (route/resources "/")
           (context "/dobavljac" [] (defroutes dobavljac-routes
                                               (GET "/" [id] (response (dobavljac/getDobavljac)))
                                               (POST "/" {params :params} (response (dobavljac/insert params)))
                                               (PUT "/" {params :params} (dobavljac/update (params "id") params))
                                               (DELETE "/:id" [id] (dobavljac/delete id))))
           (context "/zaduzenja" [] (defroutes zaduzenje-routes
                                               (GET "/:dobavljacId" [dobavljacId](response (zaduzenje/getZaduzenje dobavljacId)))
                                               (POST "/" {params :params} (response (zaduzenje/insert params)))
                                               (PUT "/" {params :params} (zaduzenje/update (params "zaduzenjeid") params))
                                               ))
           (context "/dnevnaberba" [] (defroutes dnevnaberba-routes
                                               (GET "/:dobavljacId" [dobavljacId](response (dnevnaberba/getDnevnaBerba dobavljacId)))
                                               (POST "/" {params :params} (response (dnevnaberba/insert params)))
                                               (DELETE "/:id" [id] (dnevnaberba/delete id))
                                               ))
           (context "/stavka" [] (defroutes stavka-routes
                                                 (GET "/:dnevnaberbaid" [dnevnaberbaid](response (stavka/getStavkaDnevnaBerba dnevnaberbaid)))
                                                 (POST "/" {params :params} (response (stavka/insert params)))
                                                 )))

(def app  (-> my_routes
             (wrap-json-params)
             (wrap-json-response)))
