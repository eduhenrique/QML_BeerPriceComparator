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
    width: 1024
    height: 800
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
                cadastroPage.latitudeProp = mapCenter.latitude
                cadastroPage.longitudeProp = mapCenter.longitude
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Visualizar")
            onClicked: {
              var rs = persistanceEvaluation.consulta()
            }
        }
        TabButton {
            text: qsTr("Cadastrar")
        }
        TabButton {
            text: qsTr("Mapa")
        }
    }

}
