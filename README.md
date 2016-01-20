# SistemZaPracenjePecurakaClojure

Clojure web application for work with suppliers for mushrooms. This simple web application is using Compojure for rest services, which is more like a routing library then a framework. This app is connected to mysql using standard mysql jdbc connector for communicating with database.

On the front-end, web app uses Bootstrap and JQuery libraries. It's using controller for mapping view templates for certain get requests. This is enabled by using clostache library.

This is example of rendering html template through functions:

```html
(defn read-template [template-name]
      (slurp (clojure.java.io/resource
               (str "views/" template-name ".html"))))

(defn render-template [template-file params]
      (clostache/render (read-template template-file) params))


(defn index []
      (render-template "index" {}))
```


In core.clj we use Compojure and Ring libraries for making very simple rest architecture.

```html
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
                                               (DELETE "/:id" [id] (dobavljac/delete id)))))
```

It's using ring-json for handling JSON requests and responses:

```html
(def app  (-> my_routes
             (wrap-json-params)
             (wrap-json-response)))
```

On the front-end side of the application we are using jQuery for AJAX requests for communicating with server rest services:

```html
 $.ajax({
        type: "GET",
        url: getCookie("basicURL") + "dobavljac",
        dataType: "json",
        headers: {
            'Content-Type': 'application/json'
        },
        success: function (response) {
            napuniTabelu(response);
        }
    });
```

Suppliers table:
![Alt text](resources/public/img/s1.png?raw=true "Suppliers table")

Debts table :
![Alt text](resources/public/img/s2.png?raw=true "Debts table")

Daily harvest table :
![Alt text](resources/public/img/s3.png?raw=true "Daily harvest table")

Inserting items for daily harvest example :
![Alt text](resources/public/img/s4.png?raw=true "Inserting items for daily harvest example")

FON 2016 january

## Usage

File projekat_prosoft.sql needs to be imported into mysql database.

Start web application using 'lein ring server 3000' command.

## License

Copyright © 2016 FIXME

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.