(ns mybank.domain.stavkadnevneberbe
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

(defn getStavkaDnevnaBerba [id]
      (jdbc/query mysql-db
                  ["SELECT * FROM stavkadnevneberbe d WHERE d.dnevnaberbaid = ?" id]))

(defn insert
      [params]
      (jdbc/insert! mysql-db :stavkadnevneberbe params))