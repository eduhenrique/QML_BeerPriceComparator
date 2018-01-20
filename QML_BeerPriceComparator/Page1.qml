import QtQuick 2.7
import QtQuick.LocalStorage 2.0

Page1Form {
    button1.onClicked: {
        label2page.text = textField1.text.toString();
        console.log("Button Pressed. Entered text: " + textField1.text);

    }
    Component.onCompleted: connection()


    function connection() {
        var db = LocalStorage.openDatabaseSync("QBeerDB", "1.0", "Save information of Beer", 10000);

        db.transaction(
            function(tx){
                tx.executeSql('CREATE TABLE IF NOT EXISTS Beer(nome TEXT)');
                }
            )
        return db;
    }
}

