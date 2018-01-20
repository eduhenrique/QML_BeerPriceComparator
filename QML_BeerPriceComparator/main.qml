import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.LocalStorage 2.0

//  Link do papper QMl bit.do/espa04qt

ApplicationWindow {
    id: app
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Database{
        id: databaseInstance
    }

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





}
