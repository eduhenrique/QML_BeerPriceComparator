import QtQuick 2.0

Item {
    id: databaseEvaluation

    signal beerLoaded(var beers)
    signal beerRegistered(var beer)

    Component.onCompleted: consulta()

    function deleteBeer(id){
        var url = "http://agora-server.herokuapp.com/beersale/"+id
        remove(url, function(o){            
            console.log("ITEM " + id +" Deletado")
        })
    }


    function addBeer(nome, tamanho, preco, latitude, longitude){

        var url = "http://agora-server.herokuapp.com/beersale";
        var params = "beer_name="+nome+"&volume="+tamanho+"&price_per_ml="+preco+"&seller_latitude="+latitude+"&seller_longitude="+longitude+"";

        add(url, params, function(o){
            console.log(o.responseText)
        })
    }

    function consulta(){
        var rs = []
        request('http://agora-server.herokuapp.com/beersales', function (o) {

            var d = eval('new Object(' + o.responseText + ')');
            console.log("d: " + d)
            for(var i = 0; i < d.length; i++){
                var item = d[i]
                var obj ={
                    "itemId": parseInt(item.id),
                    "nome": item.beer_name,
                    "volume": item.volume,
                    "preco": parseFloat(item.price_per_ml),
                    "latitude": parseFloat(item.seller_latitude),
                    "longitude": parseFloat(item.seller_longitude)
                }
                rs.push(obj)
            }
            beerLoaded(rs)
        });
    }

    function remove(url, callback) {
            var xhr = new XMLHttpRequest();

            xhr.onreadystatechange = (function(myxhr) {
                return function() {
                    if(myxhr.readyState === 4){
                       callback(myxhr)
                    }
                }

            })(xhr);
            xhr.open('DELETE', url, true);
            xhr.send('');
    }


    function add(url,params, callback) {
        var http = new XMLHttpRequest()
        http.open("POST", url, true);

        // Send the proper header information along with the request
        http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        http.setRequestHeader("Content-length", params.length);
        http.setRequestHeader("Connection", "close");

        http.onreadystatechange = function() { // Call a function when the state changes.
                    if (http.readyState == 4) {
                        if (http.status == 200) {
                            console.log("ok")
                        } else {
                            console.log("error: " + http.status)
                        }
                    }
                }
        http.send(params);
    }

    function request(url, callback) {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = (function(myxhr) {
                return function() {
                    if(myxhr.readyState === 4){
                       callback(myxhr)
                    }
                }

            })(xhr);
            xhr.open('GET', url, true);
            xhr.send('');
    }
}
