(ns mybank.domain.mesto
    (:refer-clojure :exclude [get])
    (:require [clojure.java.jdbc :as jdbc]
      [clojure.java.jdbc.sql :as sql]
      ))

(def mysql-db {
               :subprotocol "mysql"
               :subname "//localhost:3306/projekat_prosoft"
               :user "mare"
               :password "mare"
               })

(defn getMesto []
      (jdbc/query mysql-db
                  ["SELECT * FROM mesto m"]))

