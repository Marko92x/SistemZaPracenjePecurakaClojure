$(document).ready(function () {
    ucitajDnevneBerbe();
});

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

function ucitajDnevneBerbe() {
    $.ajax({
        type: "GET",
        url: getCookie("basicURL") + "dnevnaberba/" + getCookie("dobavljac"),
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
    ucitajDnevneBerbe();
    var id = 0;
    id = window.setInterval(ucitajDnevneBerbe, 100);
    window.clearInterval(id);
}

function napuniTabelu(dnevneberbe) {
    if (typeof dnevneberbe !== "undefined") {
        var table = document.getElementById('tblDnevneBerbe');
        table.innerHTML = "";
        var table_body = document.createElement('TBODY');
        table.appendChild(table_body);
        var tHead = document.createElement('THEAD');
        var arrayHeader = ["JMBG", "Datum"];

        for (var i = 0; i < arrayHeader.length; i++) {
            tHead.appendChild(document.createElement("TH")).appendChild(document.createTextNode(arrayHeader[i]));
        }
        tHead.appendChild(document.createElement("TH")).appendChild(document.createTextNode(""));
        tHead.appendChild(document.createElement("TH")).appendChild(document.createTextNode(""));
        for (var x = 0; x < dnevneberbe.length; x++) {
            var tr = document.createElement('TR');
            table_body.appendChild(tr);

            for (var j = 0; j < 2; j++) {
                var td = document.createElement('TD');
                switch (j) {
                    case 0:
                        td.id = "td_id_" + dnevneberbe[x].jmbg;
                        td.appendChild(document.createTextNode(dnevneberbe[x].jmbg));
                        break;
                    case 1:
                        var d = new Date(dnevneberbe[x].datum);
                        var y = d.getUTCFullYear();
                        var da = d.getUTCDate() + 1;
                        var m = d.getUTCMonth() + 1;
                        td.appendChild(document.createTextNode(da + "." + m + "." + y + "."));
                        break;
                    default:
                }
                tr.appendChild(td);
            }
        }
        table.appendChild(tHead);
    }
}

var dnevnaBerbaId;
var listaStavkiJson = [];

$(function() {

var dialog, form;

    function checkTrue(x , y){
        if((x.val() === "" && y.val() !== "" ) || (x.val() !== "" && y.val() === "")){
            return false;
        }
        return true;
    }


function dodaj() {
    var valid = true;

    valid = valid && checkTrue($('#tacne'), $('#cenaTacne'));
    valid = valid && checkTrue($('#prvaKlasa'), $('#cenaPrveKlase'));
    valid = valid && checkTrue($('#drugaKlasa'), $('#cenaDrugeKlase'));
    valid = valid && checkTrue($('#trecaKlasa'), $('#cenaTreceKlase'));
    valid = valid && !($('#tacne').val() === "" &&
        $('#cenaTacne').val() === "" &&
        $('#prvaKlasa').val() === "" &&
        $('#cenaPrveKlase').val() === "" &&
        $('#drugaKlasa').val() === "" &&
        $('#cenaDrugeKlase').val() === "" &&
        $('#trecaKlasa').val() === "" &&
        $('#cenaTreceKlase').val() === "");

    var tacne = $('#tacne').val();
    var cenaTacne = $('#cenaTacne').val();
    var prvaKlasa = $('#prvaKlasa').val();
    var cenaPrveKlase = $('#cenaPrveKlase').val();
    var drugaKlasa  =$('#drugaKlasa').val();
    var cenaDrugeKlase = $('#cenaDrugeKlase').val();
    var trecaKlasa  =$('#trecaKlasa').val();
    var cenaTreceKlase = $('#cenaTreceKlase').val();

    if (tacne === "") {
        tacne = 0;
    } else {
        tacne = parseInt(tacne);
    }
    if (cenaTacne === "") {
        cenaTacne = 0;
    } else {
        cenaTacne = parseInt(cenaTacne);
    }
    if (prvaKlasa === "") {
        prvaKlasa = 0;
    } else {
        prvaKlasa = parseInt(prvaKlasa);
    }
    if (cenaPrveKlase === "") {
        cenaPrveKlase = 0;
    } else {
        cenaPrveKlase = parseInt(cenaPrveKlase);
    }
    if (drugaKlasa === "") {
        drugaKlasa = 0;
    } else {
        drugaKlasa = parseInt(drugaKlasa);
    }
    if (cenaDrugeKlase === "") {
        cenaDrugeKlase = 0;
    } else {
        cenaDrugeKlase = parseInt(cenaDrugeKlase);
    }
    if (trecaKlasa === "") {
        trecaKlasa = 0;
    } else {
        trecaKlasa = parseInt(trecaKlasa);
    }
    if (cenaTreceKlase === "") {
        cenaTreceKlase = 0;
    } else {
        cenaTreceKlase = parseInt(cenaTreceKlase);
    }

    if(valid === false) {
        alert("Niste ispravno uneli podatke");
    } else {
        var jsonS = {
            "tacne" : tacne,
            "prvaklasa": prvaKlasa,
            "drugaklasa": drugaKlasa,
            "trecaklasa": trecaKlasa,
            "cenatacne" : cenaTacne,
            "cenaprvaklasa" : cenaPrveKlase,
            "cenadrugaklasa" : cenaDrugeKlase,
            "cenatrecaklasa" : cenaTreceKlase,
            "dnevnaberbaid" : dnevnaBerbaId,
            "jmbg" : getCookie("dobavljac")
        };

        //listaStavkiJson.push(jsonS);
        var json = JSON.stringify(jsonS);

        $.ajax({
            type: "POST",
            url: getCookie("basicURL") + "stavka",
            data: json,
            headers: {
                'Content-Type': 'application/json'
            },
            success: function (response) {
                alert("Uspesno ste kreirali stavku!");

                refresh();
            },
            error: function (response) {
                refresh();
            }
        });

        $('#tacne').val("");
       $('#cenaTacne').val("");
        $('#prvaKlasa').val("");
        $('#cenaPrveKlase').val("");
        $('#drugaKlasa').val("");
         $('#cenaDrugeKlase').val("");
        $('#trecaKlasa').val("");
        $('#cenaTreceKlase').val("");

    }
    return valid;
}



dialog = $( "#dialog-form" ).dialog({
    autoOpen: false,
    height: 700,
    width: 510,
    modal: true,
    buttons: {
        "Dodaj stavku": dodaj,
        Cancel: function() {
            dialog.dialog( "close" );
        }
    },
    close: function() {
        form[ 0 ].reset();
    }
});

form = dialog.find( "form" ).on( "submit", function( event ) {
    event.preventDefault();
    dodaj();
});


    $('#btnDodajDnevnuBerbu').click(function(){

        listaStavkiJson = [];

        var jsonS = {
            "datum" : todayDate(),
            "jmbg" : getCookie('dobavljac')
        };
        var json = JSON.stringify(jsonS);

        $.ajax({
            type: "POST",
            url: getCookie("basicURL") + "dnevnaberba",
            data: json,
            headers: {
                'Content-Type': 'application/json'
            },
            success: function (response) {
                dnevnaBerbaId = response[0].generated_key;
            },
            error: function (response) {
                refresh();
            }
        });



        dialog.dialog("open");
    });

    });

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
