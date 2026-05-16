import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.theme

Item { id: root

    required property var monitor
    Layout.preferredWidth: 240
    Layout.fillHeight: true 

    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        width: workspaceRow.implicitWidth + 20 // Make it 20 px wider than the width of the rectangles to contain them
        height: 30
        radius: 10
        color: Qt.darker(Theme.wal.colors.color8, 2.5)


        RowLayout {
            id: workspaceRow
            anchors.centerIn: parent
            spacing: 4

            Repeater {
                model: Hyprland.workspaces.values
                    .filter(workspace =>
                        workspace.monitor?.name === root.monitor.name &&
                        workspace.id > 0
                    )
                    .sort((a, b) => a.id - b.id)

                Rectangle {
                    required property var modelData
                    property bool isActive: modelData.active

                    width: 30
                    height: 24
                    radius: 7

                    color: isActive
                        ? Theme.wal.colors.color2
                        : "transparent"

                    opacity: isActive ? 1.0 : 0.65

                    Behavior on color {
                        ColorAnimation { duration: 90 }
                    }

                    Behavior on opacity {
                        NumberAnimation {
                            duration: 90
                            easing.type: Easing.OutQuad
                        }
                    }

                    Text {
                        anchors.centerIn: parent
                        text: modelData.id
                        color: Theme.wal.special.foreground
                        font.family: Theme.fontFamily
                        font.pixelSize: 16
                        font.bold: true
                    }
                }
            }
        }
    }
}
