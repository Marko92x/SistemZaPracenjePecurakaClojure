(ns mybank.domain.dobavljac
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

(defn getDobavljac []
      (jdbc/query mysql-db
                  ["SELECT * FROM dobavljac d"]))

(defn insert
      [params]
      (jdbc/insert! mysql-db :dobavljac params))

(defn delete [id]
      (jdbc/delete! mysql-db :dobavljac (sql/where {:id id})))

(defn update [id params]
      (jdbc/update! mysql-db :dobavljac params (sql/where {:id id})))
