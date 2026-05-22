import QtQuick
import QtQuick.Layouts
import qs.theme
import Quickshell.Io

RowLayout {
    spacing: 6

    Text {
        text: {
            if (Volume.isMuted) return ""
            if (Volume.volumeLevel === 0) return ""
            if (Volume.volumeLevel < 33) return ""
            if (Volume.volumeLevel < 66) return ""
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
    
    Item {
        MouseArea {
            anchors.fill: parent
            onClicked: launchProcess.running = true
        }
    }

    Process {
        id: launchProcess
        command: ["pwvucontrol"]
    }
}
