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
        //color: Theme.background
        //border.color: Theme.accent
        color: Qt.alpha(Theme.accent, 0.2)
        border.color: "transparent"
        border.width: Theme.strokeWidth
        anchors.fill: parent
        radius: Theme.globalRadius

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
