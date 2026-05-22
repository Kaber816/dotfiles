import QtQuick
import QtQuick.Layouts
import qs.theme
import Quickshell.Io

Item {
    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: launchProcess.running = true
    }

    Process {
        id: launchProcess
        command: ["pwvucontrol"]
    }

    RowLayout {
        id: row
        spacing: 6

        Text {
            text: {
                if (Volume.isMuted) return ""
                if (Volume.volumeLevel < 10) return ""
                if (Volume.volumeLevel < 50) return ""
                return ""
            }
            color: Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.font.normal
            Layout.alignment: Qt.AlignVCenter
        }

        Text {
            text: Volume.isMuted ? "muted" : Volume.volumeLevel + "%"
            color: Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.font.normal
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
