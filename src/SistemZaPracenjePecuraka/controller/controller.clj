(ns mybank.controller.controller
    (:require
      [clostache.parser :as clostache]))


(defn read-template [template-name]
      (slurp (clojure.java.io/resource
               (str "views/" template-name ".html"))))

(defn render-template [template-file params]
      (clostache/render (read-template template-file) params))


(defn index []
      (render-template "index" {}))

(defn radi []
      (render-template "radi" {}))

(defn dnevneberbe []
      (render-template "dnevne-berbe" {}))
