import QtQuick 2.7
import QtQuick.LocalStorage 2.0

Page1Form {
    button1.onClicked: {
        //Binding
        //label2page.text = Qt.binding(function() { return textField1.text } )
        //Atribuição/
        label2page.text = textField1.text;
        console.log("Button Pressed. Entered text: " + textField1.text);

        app.db.transaction(function(tx){
            tx.executeSql('INSERT INTO Beer VALUES(?, ?)', [ 1, 'world' ]);
        }
        )
    }


}

