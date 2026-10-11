// WeatherWidget.qml
import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import qs.theme

Item {
    id: root
    width: 250
    height: 250

    Rectangle {
        border.color: Theme.accent
        color: Qt.alpha(Theme.accent, 0.05)
        border.width: Theme.strokeWidth
        anchors.fill: parent
        radius: Theme.globalRadius
        clip: true

        //Rectangle {
        //    color: Theme.background
        //    border.color: "transparent"
        //    border.width:0
        //    anchors.verticalCenter: parent.bottom
        //    anchors.horizontalCenter: parent.horizontalCenter
        //    width: parent.width
        //    height: parent.height
        //    radius: 250
        //}

        Text {
            anchors.centerIn:parent
            anchors.verticalCenterOffset: -40
            color: Theme.foreground
            font.pixelSize: 130
            text: Weather.icon
        }

        Text {
            anchors.centerIn:parent
            anchors.verticalCenterOffset: 70
            color: Theme.foreground
            font.pixelSize: 50
            font.bold: true
            text: Weather.temperature
        }

    }
}
