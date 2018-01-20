import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.LocalStorage 2.0

//bit.do/espa04

ApplicationWindow {
    id: app
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property var db : LocalStorage.openDatabaseSync("QBeerDB", "1.0", "Save information of Beer", 1000000)

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
            id: pg1
        }

        Page {
            id: secondPage
            Label {
                id:label2page
                text: qsTr("Second page")
                anchors.centerIn: parent
                onTextChanged: label3page.text = "textaaa"
            }
        }

        Page {
            id:thirdPage
            Label {
                id:label3page
                text: qsTr("Third page")
                anchors.centerIn: parent
            }
        }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
        }
        TabButton {
            text: qsTr("Second")
        }
        TabButton {
            text: qsTr("Third one")
        }
    }

    Component.onCompleted: connection()

    function connection() {

        console.log("db:" + app.db)

        app.db.transaction(
            function(tx){
                tx.executeSql("CREATE TABLE IF NOT EXISTS Beer(id INT, nome TEXT)");
                // /home/qt/.local/share/QML_BeerPriceComparator
                }
            )
    }



}
