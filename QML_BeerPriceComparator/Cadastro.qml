import QtQuick 2.7
import QtQuick.Controls 2.1

Page {
    x:0
    y:0
    height: 570
    width: 700
    title: "Cadastrar Cerveja"
    property real longitudeProp: 0
    property real latitudeProp: 0
    transformOrigin: Item.Center

    Rectangle{
        id: topBar
        width: 600
        height: 570
        anchors.bottomMargin: 451
        anchors.rightMargin: 196
        anchors.fill: parent

        Label{
            x: 129
            y: 0
            text: qsTr("Cadastro")
            color:"red"

            font.pointSize: Font.Light
        }
        Rectangle{
            color: "black"
            height: 1
            width: parent.width
            //anchors.bottom: parent.bottom
        }
    }

        Label{
          id: row1label
          //x: 46
          //y: 213
          x: 43
          y: 74
          color: "red"
          text: qsTr("Cerveja: ")
        }

        ComboBox{
             id: nome
             //x: 131
             //y: 199
             x: 131
             y: 60
             width: 200
             model: [ "Skol", "CervejaSo", "Schin", "Itaipava"]
        }
            Label{
                id: row2label1
                //x: 46
                //y: 167
                x: 46
                y: 120
                color: "red"
                text: qsTr("Volume: ")
            }

            TextField {
                id: tamanho
                //x: 131
                //y: 153
                x: 131
                y: 106
                placeholderText: qsTr("em ml")                
            }

            Label{
                id: row2label2
                //x: 56
                //y: 253
                x: 46
                y: 167
                color: "red"
                text: qsTr("Preço: ")
            }
            TextField {
                id: preco
                //x: 131
                //y: 247
                x: 131
                y: 153
            }

            Label{
                id: row3label1
                //x: 43
                //y: 74
                x: 46
                y: 213
                height: 13
                color: "red"
                text: qsTr("Latitude: ")
            }

            TextField {
                id: latitude
                //x: 131
                //y: 60
                x: 131
                y: 199
                placeholderText: qsTr("Latitude")
                text: latitudeProp == 0 ? '' : latitudeProp.valueOf()
                readOnly: true
            }

            Label{
                id: row3label2
                x: 46
                y: 253
                //x: 46
                //y: 167
                color: "red"
                text: qsTr("Longitude: ")
            }

            TextField {
                id: longitude
                x: 131
                y: 247
                //x: 131
                //y: 153
                placeholderText: qsTr("Longitude")
                text: longitudeProp == 0 ? '' : longitudeProp.valueOf()
                readOnly: true
            }

            Button{
                id: mapButtom
                x: 333
                y: 225
                text: qsTr("Escolher Valores")
                onClicked: {
                    swipeView.incrementCurrentIndex()
                }
            }

            Button {
                id: cadastrar
                x: 185
                y: 299
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

