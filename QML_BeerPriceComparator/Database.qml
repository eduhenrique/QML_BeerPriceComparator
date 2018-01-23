import QtQuick 2.0
import QtQuick.LocalStorage 2.0


Item {
    id : database
    property var db : LocalStorage.openDatabaseSync("QBeerDB", "1.0", "Save information of Beer", 1000000)

    signal beerRegistered(var beer)
    signal beerLoaded(var beers)

    Component.onCompleted: connection()

    function connection() {

        console.log("db:" + database.db)

        database.db.transaction(
            function(tx){
                tx.executeSql("CREATE TABLE IF NOT EXISTS Beer(id integer not null primary key autoincrement, nome TEXT,
                 tamanho TEXT, preco FLOAT, local TEXT)");
                // /home/qt/.local/share/QML_BeerPriceComparator/QML/OfflineStorage/Databases/
                }
            )
        loadBeers()
    }

    function addBeer(nome, tamanho, preco, local){
        var rs = {}
        database.db.transaction(function(tx){
          rs = tx.executeSql('INSERT INTO Beer(?,?,?,?,?)',[null, nome, tamanho, preco, local])
            beerRegistered({
                "itemId": parseInt(rs.insertId),
                "nome": nome,
                "tamanho": tamanho,
                "preço": parseFloat(preco),
                "local": local
            })
        })
        return rs.insertId
    }

    function deleteBeer(id){
        var rs = {}
        database.db.transaction(function(tx){
            rs = tx.executeSql('DELETE FROM Beer WHERE id=?',[parseInt(id)])
        })
        return rs
    }

    function loadBeers(){
        var rs = []
        database.db.transaction(function(tx){
            var results = tx.executeSql('SELECT * FROM Beer')
            for(var i = 0; i < results.rows.length; i++){
                var item = results.rows.item(i)
                var obj ={
                    "itemId": parseInt(item.insertId),
                    "nome": item.nome,
                    "tamanho": item.tamanho,
                    "preço": parseFloat(item.preco),
                    "local": item.local
                }
                rs.push(obj)
            }
        })
        beerLoaded(rs)
    }

}
