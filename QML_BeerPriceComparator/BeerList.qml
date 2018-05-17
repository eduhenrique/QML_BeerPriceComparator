import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Window 2.2

Page {
    x:0
    y:0
    height: 600
    width: 600
    title: "Comparador de Preço de cervejas"
    property alias beerListViewModel: beerListView.model

    Label{
        width: 200
        height: 30
        text: "                   Carregando Itens"
        anchors.verticalCenterOffset: -159
        anchors.horizontalCenterOffset: -175
        anchors.centerIn: parent
        visible: !beerListView.model.count
    }

    ListView{
        id: beerListView
        anchors.rightMargin: 282
        anchors.bottomMargin: -6
        anchors.leftMargin: -121
        anchors.topMargin: 6
        model: ListModel { }
        anchors.fill: parent

        header:

                Label{
                    x: 131
                    y: 199
                    text: qsTr("Beer Price Comparator")
                    color:"red"
                    font.pointSize: Font.Light
                }

        delegate: Rectangle{
            id : delegate
            width: 150
            height: 150

            property int _itemId : itemId
            property string _nome: nome
            property real _volume: volume
            property double _preco: preco
            property real _latitude: latitude
            property real _longitude: longitude

            Column{
                //anchors{fill: parent; margins: 50 }

                    Label {
                        x: 131
                        y: 199
                        id: txtItemId
                        text: itemId
                    }

                    Text {
                        x: 131
                        y: 199
                        id: txtNome
                        text: " Cerveja: "  + nome
                    }

                    Text{
                        x: 131
                        y: 199
                        id: txtVolume
                        text: " volume: " + volume
                    }

                    Text{
                        x: 131
                        y: 199
                        id: txtValor
                        text: " Valor: " + preco
                    }

                    Text{
                        x: 131
                        y: 199
                        id: txtLatitude
                        text: " Latitude: " + latitude
                    }

                    Text{
                        x: 131
                        y: 199
                        id: txtLongitude
                        text: " Longitude: " + longitude
                    }

                    Button {
                        id: excluir
                        x: 131
                        y: 293
                        text: qsTr("Excluir")
                        onClicked: {
                            console.log("Excluir clicked")
                            persistanceEvaluation.deleteBeer(txtItemId.text)
                            persistanceEvaluation.consulta()
                        }
                    }
            }
        }
    }
}
