import QtQuick
import QtQuick.Layouts
import qs.theme
import Quickshell.Io

RowLayout {
    spacing: 6

    Rectangle {
        Layout.preferredWidth: 25
        Layout.preferredHeight: 25
        radius: width / 2
        color: Theme.accent

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: launchProcess.running = true
        }

        Process {
            id: launchProcess
            command: ["kitty","htop"] 
        }

        Text {
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0.4
            text: ""
            color: Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.font.normal
        }

    }

    // Widest expected string for sizing
    TextMetrics {
        id: ramMetrics 
        font.family: Theme.fontFamily
        font.pixelSize: Theme.font.normal
        text: "31.9GB"
    }

    Text {
        text: RamUsage.ramUsage.toFixed(1) + "GB"
        color: Theme.foreground
        font.family: Theme.fontFamily
        font.pixelSize: Theme.font.normal
        Layout.alignment: Qt.AlignVCenter
        Layout.preferredWidth: ramMetrics.width
        horizontalAlignment: Text.AlignHCenter
    }
}

