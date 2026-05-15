import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.theme

RowLayout {
    id: root

    required property var monitor

    Repeater {
        model: Hyprland.workspaces.values
            .filter(workspace => workspace.monitor?.name === root.monitor.name && workspace.id > 0)
            .sort((a, b) => a.id - b.id)

        Rectangle {
            required property var modelData
            property bool isActive: modelData.active

            width: 32
            height: 28
            radius: 6
            color: isActive ? Theme.wal.colors.color2 : "transparent"

            Text {
                anchors.centerIn: parent
                text: modelData.id
                color: Theme.wal.special.foreground
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.normal

                font {
                    pixelSize: 16
                    bold: true
                }
            }
        }
    }
}
