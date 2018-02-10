import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Window 2.2

Page {
    title: "Comparador de Preço de cervejas"
    property alias beerListViewModel: beerListView.model

    Label{
        text: "Nenhuma Cerveja cadastrada"
        anchors.centerIn: parent
        visible: !beerListView.model.count
    }

    ListView{
        id: beerListView
        model: ListModel { }
        anchors.fill: parent

        header:
        Rectangle{
                width: parent.width;
                height: 33
                Label{
                    text: qsTr("Beer Price Comparator")
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

        delegate: Rectangle{
            id : delegate
            width: parent.width
            height: 80

            property int _itemId : itemId
            property string _nome: nome
            property real _volume: volume
            property double _preco: preco
            property real _latitude: latitude
            property real _longitude: longitude

            Column{
                anchors{fill: parent; margins: 50 }

                Row{
                    spacing: 2

                    Label {
                        id: txtItemId
                        text: itemId
                    }
                }
                Row{
                    spacing: 2

                    Text {
                        id: txtNome
                        text: " Cerveja: "  + nome
                    }
                    Text{
                        id: txtVolume
                        text: " volume: " + volume
                    }
                    Text{
                        id: txtValor
                        text: " Valor: " + preco
                    }
                    Text{
                        id: txtLatitude
                        text: " Latitude: " + latitude
                    }
                    Text{
                        id: txtLongitude
                        text: " Longitude: " + longitude
                    }
                }
            }
        }
    }

}
