/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
//    ucitajDnevneBerbe();
//    dugmici("DDD");
//    alert("asd");
    dugmici("XXX");
    ucitajZaduzenja();
});

function ucitajZaduzenja() {
    $.ajax({
        type: "GET",
        url: getCookie("basicURL") + "zaduzenja/" + getCookie("dobavljac"),
        dataType: "json",
        headers: {
            'Content-Type': 'application/json'
        },
        success: function (response) {

            napuniTabelu(response);
        }
    });
}

function napuniTabelu(zaduzenja) {
    if (typeof zaduzenja !== "undefined") {
        var table = document.getElementById('tblZaduzenja');
        table.innerHTML = "";
        var table_body = document.createElement('TBODY');
        table.appendChild(table_body);
        var tHead = document.createElement('THEAD');
        var arrayHeader = ["Datum zaduzenja", "Datum razduzenja"];

        for (var i = 0; i < arrayHeader.length; i++) {
            tHead.appendChild(document.createElement("TH")).appendChild(document.createTextNode(arrayHeader[i]));
        }
        tHead.appendChild(document.createElement("TH")).appendChild(document.createTextNode(""));
        tHead.appendChild(document.createElement("TH")).appendChild(document.createTextNode(""));
        for (var x = 0; x < zaduzenja.length; x++) {
            var tr = document.createElement('TR');
            table_body.appendChild(tr);

            for (var j = 0; j < 7; j++) {
                var td = document.createElement('TD');
                switch (j) {
                    case 0:
                        var d = new Date(zaduzenja[x].datumzaduzenja);
                        var y = d.getUTCFullYear();
                        var da = d.getUTCDate() + 1;
                        var m = d.getUTCMonth() + 1;
                        td.appendChild(document.createTextNode(da + "." + m + "." + y + "."));
                        break;
                    case 1:
                        if (zaduzenja[x].datumrazduzenja === null) {
                            td.appendChild(document.createTextNode("Nije razduzeno!"));
                        }
                        else {
                            var d = new Date(zaduzenja[x].datumrazduzenja);
                            var y = d.getUTCFullYear();
                            var da = d.getUTCDate() + 1;
                            var m = d.getUTCMonth() + 1;
                            td.appendChild(document.createTextNode(da + "." + m + "." + y + "."));
                        }
                        break;
                    case 2:
                        var b = document.createElement('BUTTON');
                        b.className = "button btn-info";
                        b.appendChild(document.createTextNode("Razduzi"));
                        b.id = "XXX" + zaduzenja[x].zaduzenjeid;
                        td.appendChild(b);
                        break;
                    case 3:
                    default:
                }
                tr.appendChild(td);
            }
        }
        table.appendChild(tHead);
    }
}

function todayDate(){
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();

    if(dd<10) {
        dd='0'+dd
    }

    if(mm<10) {
        mm='0'+mm
    }
    today = yyyy+'-'+mm+'-'+dd;
    //today = mm+'/'+dd+'/'+yyyy;
    return today;
}

$("#btnDodajZaduzenje").click(function () {
    var kompost = document.getElementById('k').checked;
    var prevoz = document.getElementById('p').checked;
    var brojVreca = document.getElementById('brojVreca').value;
    if (brojVreca === "") {
        brojVreca = 0;
    } else {
        brojVreca = parseInt(brojVreca);
    }
    var jsonS = {
        "datumzaduzenja" : todayDate(),
        "brojvreca": brojVreca,
        "kompost": kompost,
        "prevoz": prevoz,
        "jmbg" : getCookie("dobavljac")
    };
    var json = JSON.stringify(jsonS);
    $.ajax({
        type: "POST",
        url: getCookie("basicURL") + "zaduzenja",
        data: json,
        headers: {
            'Content-Type': 'application/json'
        },
        success: function (response) {

            refresh();
        },
        error: function (response) {
            refresh();
        }
    });
});

function dugmici(delimiter) {
    $(function () {
        $(document).on('click', '[id^=' + delimiter + "]", function () {
            var id = jQuery(this).attr("id");
            alert(id);
            var niz = id.split(delimiter);
            var id1 = niz[1];
            var jsonS = {
                "datumrazduzenja" : todayDate(),
                "jmbg" : getCookie("dobavljac"),
                "zaduzenjeid" : id1
            };
            var json = JSON.stringify(jsonS);
            $.ajax({
                type: "PUT",
                url: getCookie("basicURL") + "zaduzenja",
                data: json,
                headers: {
                    'Content-Type': 'application/json'
                },
                success: function (response) {

                    refresh();
                },
                error: function (response) {
                    refresh();
                }
            });
        });
    });
}

function refresh() {
    ucitajZaduzenja();
    var id = 0;
    id = window.setInterval(ucitajZaduzenja, 100);
    window.clearInterval(id);
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ')
            c = c.substring(1);
        if (c.indexOf(name) == 0)
            return c.substring(name.length, c.length);
    }
    return "";
}