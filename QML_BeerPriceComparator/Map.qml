import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import QtQuick.Layouts 1.3
import QtLocation 5.6
import QtPositioning 5.6

Page {
    property alias beerLocationModel: mapview.model
    property alias beerMarker: currentMarker.sourceImg
    property string currentPlaceName: "SSA"
    property variant currentPlaceCoordinates: QtPositioning.coordinate(-12.9978, -38.4777)
    signal coordinatesChose(var mapCenter)

    id: mapPage
    title: currentPlaceName

    Plugin {
        id: mapPlugin
        name: "osm" // "mapboxgl", "esri", ...
        //PluginParameter { name: "osm.useragent"; value: "My First QML App" }
        //PluginParameter { name: "osm.mapping.host"; value: "http://osm.tile.server.address/" }
        //PluginParameter { name: "osm.mapping.copyright"; value: "Open Street Map" }
        //PluginParameter { name: "osm.routing.host"; value: "http://osrm.server.address/viaroute" }
        //PluginParameter { name: "osm.geocoding.host"; value: "http://geocoding.server.address" }
    }

    /*PlaceSearchModel {
        id: searchModel
        plugin: mapPlugin
        searchArea: QtPositioning.circle(currentPlaceCoordinates);
        Component.onCompleted: update()
    }*/

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        center: currentPlaceCoordinates
        zoomLevel: 15

        ItemMarker{            
           id: currentMarker
           mapQuickItemPlaceCoordinates: currentPlaceCoordinates
           //sourceImg: "qrc:/marker.png"
           sourceImg: ""
        }

        MapItemView {
            id: mapview
            //model: searchModel
            model: ListModel{}
            delegate: ItemMarker{
                property int _itemId : itemId
                property string _nome: nome
                property real _volume: volume
                property double _preco: preco
                property real _latitude: latitude
                property real _longitude: longitude
               mapQuickItemPlaceCoordinates: QtPositioning.coordinate( _latitude, _longitude)
            }
        }

        MouseArea{
            anchors.fill: parent

            onDoubleClicked: {
                var mouseGeoPos = map.toCoordinate(Qt.point(mouse.x, mouse.y));
                var preZoomPoint = map.fromCoordinate(mouseGeoPos, false);
                if (mouse.button === Qt.LeftButton) {
                    map.zoomLevel = Math.floor(map.zoomLevel + 1)
                } else if (mouse.button === Qt.RightButton) {
                    map.zoomLevel = Math.floor(map.zoomLevel - 1)
                }

                var postZoomPoint = map.fromCoordinate(mouseGeoPos, false);
                var dx = postZoomPoint.x - preZoomPoint.x;
                var dy = postZoomPoint.y - preZoomPoint.y;

                var mapCenterPoint = Qt.point(map.width / 2.0 + dx, map.height / 2.0 + dy);
                map.center = map.toCoordinate(mapCenterPoint);
                //console.log("Latitude: " + map.center.latitude + "  Longitude: " + map.center.longitude)
            }

            onPressAndHold: {
                currentMarker.sourceImg = "qrc:/marker.png"
                currentMarker.coordinate = map.toCoordinate(Qt.point(mouse.x, mouse.y));
                coordinatesChose(map.center)                
                //swipeView.decrementCurrentIndex();
                //swipeView.setCurrentIndex(swipeView.currentIndex-1)
            }

            Button{
                id: menosZoom
                //text: qsTr("-")
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                height: 39
                width: 39
                Label{
                    text: qsTr("-")
                    color:"red"
                    font.pointSize: Font.Light
                    anchors.centerIn: parent

                }
                onClicked: {
                    map.zoomLevel = Math.floor(map.zoomLevel - 1)
                }
            }
            Button{
                id: maisZoom
                height: 39
                width: 39
                //text: qsTr("+")
                anchors.bottom: menosZoom.top
                anchors.right: parent.right
                Label{
                    text: qsTr("+")
                    color:"red"
                    font.pointSize: Font.Light
                    anchors.centerIn: parent
                }
                onClicked: {
                    map.zoomLevel = Math.floor(map.zoomLevel + 1)
                }
            }
        }        
    }
}
