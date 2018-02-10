import QtQuick 2.7
import QtQuick.Controls 2.1

Page {
    title: "Cadastrar Cerveja"
    property real longitudeProp: 0
    property real latitudeProp: 0

    Rectangle{
        id: topBar
        width: parent.width
        height: 35

        Label{
            text: qsTr("Cadastro")
            color:"red"

            font.pointSize: Font.Light
        }
        Rectangle{
            color: "black"
            height: 1
            width: parent.width
            anchors.bottom: parent.bottom
        }
    }

    Column{
        id: column1
        anchors.fill: parent
        anchors.margins:50

        Row {
            id:row1
            anchors.horizontalCenter: parent.horizontalCenter

            Label{
                id: row1label
                text: qsTr("Cerveja: ")
            }

            ComboBox{
                id: nome
                width: 200
                model: [ "Skol", "CervejaSo", "Schin", "Itaipava"]
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
                id: row3label1
                text: qsTr("Latitude: ")
            }
            TextField {
                id: latitude
                placeholderText: qsTr("Latitude")
                text: latitudeProp == 0 ? '' : latitudeProp.valueOf()
                readOnly: true

            }
            Label{
                id: row3label2
                text: qsTr("Longitude: ")
            }
            TextField {
                id: longitude
                placeholderText: qsTr("Longitude")
                text: longitudeProp == 0 ? '' : longitudeProp.valueOf()
                readOnly: true
            }
            Button{
                id: mapButtom
                text: qsTr("Escolher Valores")
                onClicked: {
                    swipeView.incrementCurrentIndex()
                }
            }
        }

        Row{
            id: rowmap
            anchors.top : row3.bottom
            spacing: 150
            Rectangle{
                anchors.alignWhenCentered: parent
            }
        }

        Row {
            id: row4

            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                id: cadastrar
                text: qsTr("Cadastrar")

                onClicked: {
                    console.log("Cadastro clicked")
                    var volume = tamanho.text + " ml"
                    var rs = persistanceEvaluation.addBeer(nome.currentText, volume, preco.text, latitude.text, longitude.text)

                    tamanho.clear()
                    preco.clear()
                    latitude.clear()
                    longitude.clear()

                    mapSwipePage.beerMarker = ""
                }
            }
        }

    }
}
