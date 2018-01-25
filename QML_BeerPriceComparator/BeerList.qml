import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.2

Page {
    title: "Comparador de Preço de cervejas"
    Label{
        text: "Não há cervejas registradas"
        anchors.centerIn: parent
        visible: !beerListView.model.count
    }

    ListView{
        id: beerListView
        model: ListElement{}
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
            property string nome: nome
            property string tamanho: tamanho
            property double preco: preco
            property string local: local


            MouseArea{
                anchors.fill: parent
                onPressAndHold: {
                        databaseInstance.deleteBeer(_itemId)
                        delegate.ListView.view.model.remove(index)
                }
            }

            Column{
                anchors{fill:parent; margins: 50 }

                Row{
                    Text {
                        text: nome
                    }
                    Text{
                        text: tamanho
                    }
                    Text{
                        text: preco
                    }
                    Text{
                        text: local
                    }
                }
            }

        }

    }

}
