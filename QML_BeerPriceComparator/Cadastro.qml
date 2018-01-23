import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {

    Column{
        anchors.fill: parent
        anchors.margins: 20

        Row {
            id:row1
            anchors.horizontalCenter: parent.horizontalCenter

            Label{
                id: row1label
                text: qsTr("Cerveja: ")
            }
            TextField {
                id: nome
                placeholderText: qsTr("Marca da Cerveja")
                width:parent.parent.width - row1label.width

            }
        }

        Row {
            id: row2
            anchors.horizontalCenter: parent.horizontalCenter
            Label{
                id: row2label1
                text: qsTr("Volume: ")
            }
            TextField {
                id: tamanho
                placeholderText: qsTr("em ml")
                width:parent.parent.width/2 - row2label1.width
            }

            Label{
                id: row2label2
                text: qsTr("Preço: ")
            }
            TextField {
                id: preco
                width:parent.parent.width/2 - row2label1.width
            }
        }

        Row {
            id: row3
            anchors.horizontalCenter: parent.horizontalCenter
            spacing:  10

            Label{
                id: row3label
                text: qsTr("Local: ")
            }
            TextField {
                id: local
                placeholderText: qsTr("Estabelecimento")
                width:parent.parent.width - row3label.width
            }
        }

        Row {
            id: row4
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                id: cadastrar
                text: qsTr("Cadastrar")
            }
        }
    }
}
