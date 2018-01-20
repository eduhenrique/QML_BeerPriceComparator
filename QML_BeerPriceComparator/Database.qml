import QtQuick 2.0
import QtQuick.LocalStorage 2.0


Item {
    id : database
    property var db : LocalStorage.openDatabaseSync("QBeerDB", "1.0", "Save information of Beer", 1000000)


    Component.onCompleted: connection()

    function connection() {

        console.log("db:" + database.db)

        database.db.transaction(
            function(tx){
                tx.executeSql("CREATE TABLE IF NOT EXISTS BeerTeste(id integer not null primary key autoincrement, nome TEXT)");
                // /home/qt/.local/share/QML_BeerPriceComparator/QML/OfflineStorage/Databases/
                }
            )
    }
}
