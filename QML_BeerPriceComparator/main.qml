import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

//  Link do papper QMl bit.do/espa04qt

ApplicationWindow {
    id: app
    visible: true
    width: 640
    height: 480
    title: qsTr("Beer Price Comparator")
    
    PersistanceEvaluation{
        id: persistanceEvaluation

        function limparLista()
        {
            beerListPage.beerListViewModel.clear()
        }

        function adicionarItemLista(item)
        {
            beerListPage.beerListViewModel.append(item)
        }

        onBeerLoaded: {
            limparLista()
            for(var i=0; i<beers.length; ++i){
                adicionarItemLista(beers[i])
                function(){ console.log(beers[i])}

                mapSwipePage.beerLocationModel.append(beers[i])
            }
        }
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        BeerList{
            id: beerListPage
        }
        Cadastro{
            id: cadastroPage            
        }
        Map{
            id: mapSwipePage
            onCoordinatesChose: {
                console.log("Latitude: "+mapCenter.latitude+"  Longitude: "+ mapCenter.longitude );
                cadastroPage.longitudeProp = mapCenter.longitude
                cadastroPage.latitudeProp = mapCenter.latitude
            }
        }

        Page{
            id: deletepage

            Column{

                anchors.centerIn: parent

                Row {
                    TextField {
                        id : idToDelete
                        placeholderText: qsTr("Id para deletar")
                    }
                    Button{
                        text: qsTr("Deletar")

                        onClicked: {
                           var rs = persistanceEvaluation.deleteBeer(idToDelete.text)
                                idToDelete.clear()
                        }
                    }
                }
            }
        }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Visualize as informações")
            onClicked: {
              var rs = persistanceEvaluation.consulta()
            }
        }
        TabButton {
            text: qsTr("Cadastre um novo Item")
        }
        TabButton {
            text: qsTr("Map teste")
        }
        TabButton {
            text: qsTr("Tente Deletar um item")
        }
    }

}
