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

    /*Database{
        id: databaseInstance
        onBeerRegistered: beerListPage.beerListViewModel.append(beer)
        onBeerLoaded: {
            for(var i=0; i<beers.lenght; ++i){
                beerListPage.beerListViewModel.append(beers[i])
            }
        }
    }*/

    PersistanceEvaluation{
        id: persistanceEvaluation

        onBeerLoaded: {
            for(var i=0; i<beers.lenght; ++i){
                beerListPage.beerListViewModel.append(beers[i])
                function(){ console.log(beers[i])}
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

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Visualize as informações")
        }
        TabButton {
            text: qsTr("Cadastre um novo Item")
        }
    }





}
