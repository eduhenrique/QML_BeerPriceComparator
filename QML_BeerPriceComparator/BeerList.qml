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

        header: Rectangle{
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
            height: 33

            property int _itemId : itemId
            property real nome: nome
            property real tamanho: tamanho
            property double preco: preco
            property real local: local


            /*MouseArea{
                anchors.fill: parent
                onPressAndHold: {
                        databaseInstance.deleteBeer(_itemId)
                        delegate.ListView.view.model.remove(index)
                }
            }*/

            Column{
                anchors{fill: parent; margins: 50 }

                Row{

                    Text {
                        text: " Cerveja: "  + nome
                    }
                    Text{
                        text: " Tamanho: " + tamanho
                    }
                    Text{
                        text: " Valor: " + preco
                    }
                    Text{
                        text: " Estabelecimento: " + local
                    }
                }
            }
        }
    }

}
