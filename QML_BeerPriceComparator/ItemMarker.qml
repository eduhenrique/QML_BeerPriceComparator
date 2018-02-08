import QtQuick 2.0
import QtLocation 5.6
import QtPositioning 5.6


MapQuickItem {
    property string sourceImg: "qrc:/marker2.png"
    property variant currentPlaceCoordinates: QtPositioning.coordinate(-12.6590134, -39.090068)
    id: item_marker
    coordinate: currentPlaceCoordinates
    anchorPoint.x: image.width * 0.5
    anchorPoint.y: image.height
    sourceItem: Column {
        Image { id: image; source: sourceImg; width: 45; height: width }
    }
}
