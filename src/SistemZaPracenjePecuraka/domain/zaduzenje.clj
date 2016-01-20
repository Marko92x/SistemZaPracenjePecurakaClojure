(ns SistemZaPracenjePecuraka.domain.zaduzenje
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

;(defn getZaduzenje [id]
;      (jdbc/query mysql-db
;                  [(apply str  ["SELECT * FROM zaduzenje z WHERE z.jmbg = '" id "'"])]))

(defn getZaduzenje [id]
      (jdbc/query mysql-db
                  ["SELECT * FROM zaduzenje z WHERE z.jmbg = ?" id]))

(defn insert
      [params]
      (jdbc/insert! mysql-db :zaduzenje params))

(defn update [zaduzenjeid params]
      (jdbc/update! mysql-db :zaduzenje params (sql/where {:zaduzenjeid zaduzenjeid})))

