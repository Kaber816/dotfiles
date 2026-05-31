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

        Rectangle {
            Layout.preferredWidth: 25
            Layout.preferredHeight: 25
            radius: width / 2
            color: Theme.accent

            Text {
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0.1

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
