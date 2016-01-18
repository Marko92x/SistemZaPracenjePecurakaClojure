/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var basicUrl = 'http://localhost:3000/';

document.cookie = "basicURL=" + basicUrl;

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

$(document).ready(function () {
    ucitajDobavljace();
    dugmici("DDD");
    dugmici("XXX");
});

function ucitajDobavljace() {
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
}

function refresh() {
    ucitajDobavljace();
    var id = 0;
    id = window.setInterval(ucitajDobavljace, 100);
    window.clearInterval(id);
}

function napuniTabelu(dobavljaci) {
    if (typeof dobavljaci !== "undefined") {
        var table = document.getElementById('tblDobavljaci');
        table.innerHTML = "";
        var table_body = document.createElement('TBODY');
        table.appendChild(table_body);
        var tHead = document.createElement('THEAD');
        var arrayHeader = ["JMBG", "Ime", "Prezime"];

        for (var i = 0; i < arrayHeader.length; i++) {
            tHead.appendChild(document.createElement("TH")).appendChild(document.createTextNode(arrayHeader[i]));
        }
        tHead.appendChild(document.createElement("TH")).appendChild(document.createTextNode(""));
        tHead.appendChild(document.createElement("TH")).appendChild(document.createTextNode(""));
        for (var x = 0; x < dobavljaci.length; x++) {
            var tr = document.createElement('TR');
            table_body.appendChild(tr);

            for (var j = 0; j < 7; j++) {
                var td = document.createElement('TD');
                switch (j) {
                    case 0:
                        td.id = "td_id_" + dobavljaci[x].id;
                        td.appendChild(document.createTextNode(dobavljaci[x].jmbg));
                        break;
                    case 1:
                        td.appendChild(document.createTextNode(dobavljaci[x].ime));
                        break;
                    case 2:
                        td.appendChild(document.createTextNode(dobavljaci[x].prezime));
                        break;
                    case 3:
                        var b = document.createElement('BUTTON');
                        b.className = "button btn-info";
                        b.appendChild(document.createTextNode("Radi"));
                        b.id = "XXX" + dobavljaci[x].jmbg;
                        td.appendChild(b);
                        break;
                    case 4:
                        var b = document.createElement('BUTTON');
                        b.className = "button btn-danger";
                        b.appendChild(document.createTextNode("Obriši"));
                        b.id = "DDD" + dobavljaci[x].jmbg;
                        td.appendChild(b);
                        break;
                    default:
                }
                tr.appendChild(td);
            }
        }
        table.appendChild(tHead);
    }
}

function dugmici(delimiter) {
    $(function () {
        $(document).on('click', '[id^=' + delimiter + "]", function () {
            var id = jQuery(this).attr("id");
            var niz = id.split(delimiter);
            var id1 = niz[1];

            if (delimiter === 'DDD') {
                var r = confirm("Da li ste sigurni?");
                if (r === true) {
                    $.ajax({
                        url: 'dobavljac/' + id1,
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        success: function (response) {
                            refresh();
                            alert("Usprešno ste obrisali člana!");
                        },
                        error: function (response) {
                            refresh();
                        }
                    });

                }
            } else {
                    document.cookie = "dobavljac=" + id1;
                    //window.location.href = "radi.html";

                $(function() {
                    $( "#dialog-confirm" ).dialog({
                        resizable: false,
                        height:140,
                        modal: true,
                        buttons: {
                            "Zaduzenja": function() {
                                window.location.href = "radi.html";
                            },
                            "Dnevne berbe": function() {
                                window.location.href = "dnevne-berbe.html"
                            },
                            Cancel: function() {
                                $( this ).dialog( "close" );
                            }
                        }
                    });
                });
                //window.location.replace("radi.html");
                //xhttp.open("GET", "t.html", true);
                //xhttp.send();
                //$.get( "radi.html", function( data ) {
                    //$( ".result" ).html( data );
                    //"Load was performed." );
                //});

            }

        });
    });
}


