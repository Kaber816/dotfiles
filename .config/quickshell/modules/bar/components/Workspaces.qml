import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.theme

RowLayout {
    id: root
    spacing: 6

    // 🔑 get the active monitor from PanelWindow context
    property var HyprlandWorkspace

    Repeater {
        model: monitor ? monitor.workspaces : []

        delegate: Rectangle {
            required property var modelData
            property var ws: modelData

            implicitWidth: 28
            implicitHeight: 28
            radius: 8

            color: ws.active
                ? Theme.ui.selectedBackground
                : "transparent"

            border.width: 1
            border.color: ws.active
                ? Theme.ui.selectedBackground
                : Theme.ui.border

            // ✨ smooth transitions (optional but nice)
            Behavior on color {
                ColorAnimation { duration: 120 }
            }

            Text {
                anchors.centerIn: parent
                text: ws.id
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.normal

                color: ws.active
                    ? Theme.colors.background
                    : Theme.colors.foreground
            }

            // 🖱 click to switch workspace
            MouseArea {
                anchors.fill: parent
                onClicked: ws.activate()
            }
        }
    }
}
