import QtQuick 2.0
import QtQuick.Controls 2.1

Page {
    title: "Comparador de Preço de cervejas"
    Label{
        text: "Não há cervejas registradas"
        anchors.centerIn: parent
    }

    ListView{
        id: beerListView
        model: ListElement{}
        anchors.fill: parent
    }

}
