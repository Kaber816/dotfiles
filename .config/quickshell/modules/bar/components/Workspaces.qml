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
        height: 35
        radius: height / 2
        color: Theme.backgroundSecondary

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
                    id: rectangle
                    required property var modelData
                    property bool isActive: modelData.active

                    width: 33
                    height: 27
                    radius: height / 2

                    color: isActive
                        ? Theme.accent
                        : "transparent"

                    opacity: isActive ? 1.0 : 0.65
                    border.color: workspace.hovered ? Theme.foreground : "transparent"
                    border.width: workspace.hovered ? 1.5 : 0

                    HoverHandler {
                        id: workspace
                    }

                    Behavior on color {
                        ColorAnimation { duration: 90 }
                    }

                    Behavior on border.color {
                        ColorAnimation { duration: 200 }
                    }

                    Behavior on opacity {
                        NumberAnimation {
                            duration: 90
                            easing.type: Easing.OutQuad
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor    
                        onClicked: {
                            Hyprland.dispatch("hl.dsp.focus({ workspace = " + rectangle.modelData.id + "})")

                        }
                    }

                    Text {
                        anchors.centerIn: parent
                        text: rectangle.modelData.id
                        color: Theme.foreground
                        font.family: Theme.fontFamily
                        font.pixelSize: 16
                        font.bold: true
                    }
                }
            }
        }
    }
}
