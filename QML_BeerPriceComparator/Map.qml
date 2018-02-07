import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import QtQuick.Layouts 1.3
import QtLocation 5.6
import QtPositioning 5.6

Page {
    property string currentPlaceName: "Estações de Metrô - RJ"
    property variant currentPlaceCoordinates: QtPositioning.coordinate(-12.6590134, -39.090068)

    id: mapPage
    title: currentPlaceName

    Plugin {
        id: mapPlugin
        name: "osm" // "mapboxgl", "esri", ...
        PluginParameter { name: "osm.useragent"; value: "My First QML App" }
        PluginParameter { name: "osm.mapping.host"; value: "http://osm.tile.server.address/" }
        PluginParameter { name: "osm.mapping.copyright"; value: "Open Street Map" }
        PluginParameter { name: "osm.routing.host"; value: "http://osrm.server.address/viaroute" }
        PluginParameter { name: "osm.geocoding.host"; value: "http://geocoding.server.address" }
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        center: currentPlaceCoordinates
        zoomLevel: 15

        MapQuickItem {
            id: marker
            coordinate: currentPlaceCoordinates
            anchorPoint.x: image.width * 0.5
            anchorPoint.y: image.height
            sourceItem: Column {
                Image { id: image; source: "qrc:/marker.png"; width: 45; height: width }
            }
        }
    }
}
