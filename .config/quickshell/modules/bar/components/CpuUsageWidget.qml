import QtQuick
import QtQuick.Layouts
import qs.theme
import Quickshell.Io

RowLayout {
    spacing: 6

    Rectangle {
        width: 25
        height: 25
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
            anchors.horizontalCenterOffset: -0.5
            text: ""
            color: Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.font.normal
            Layout.alignment: Qt.AlignVCenter
        }

    }


    Text {
        text: CpuUsage.cpuUsage + "%"
        color: Theme.foreground
        font.family: Theme.fontFamily
        font.pixelSize: Theme.font.normal
        Layout.alignment: Qt.AlignVCenter
    }
}
