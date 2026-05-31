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
            anchors.horizontalCenterOffset: -0.5

            text: {
                if (CpuTemp.cpuTemp < 50) return ""
                if (CpuTemp.cpuTemp < 75) return ""
                return ""
            }
            color: Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.font.normal
            Layout.alignment: Qt.AlignVCenter
        }

    }


    Text {
        text: CpuTemp.cpuTemp + "°C"
        color: Theme.foreground
        font.family: Theme.fontFamily
        font.pixelSize: Theme.font.normal
        Layout.alignment: Qt.AlignVCenter
    }
}
