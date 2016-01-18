(ns mybank.domain.dnevnaberba
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

(defn getDnevnaBerba [id]
      (jdbc/query mysql-db
                  ["SELECT * FROM dnevnaberba d WHERE d.jmbg = ?" id]))

(defn insert
      [params]
      (jdbc/insert! mysql-db :dnevnaberba params))

(defn delete [id]
      (jdbc/delete! mysql-db :dnevnaberba (sql/where {:id id})))

