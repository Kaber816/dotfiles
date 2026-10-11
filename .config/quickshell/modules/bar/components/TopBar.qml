import QtQuick
import QtQuick.Layouts
import qs.modules.bar.components
import qs.theme

Item {
signal centerHovered(bool isHovered)
    RowLayout {
        id: topBarRow
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20

        // Left item
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Workspaces {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                monitor: barScope.modelData
            }
        }

        // Center item — hover here triggers the popout
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            HoverHandler {
                id: centerHover
                onHoveredChanged: root.itemHovered(centerHover.hovered)
            }

            ClockWidget {
                anchors.centerIn: parent
            }
        }

        // Right item
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            
            RowLayout {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                spacing: 8

                ConnectionsGroup {
                    id: connectionsGroup
                    onNetworkWidgetHoveredChanged: {
                        if (connectionsGroup.networkWidgetHovered) {
                            networkCloseTimer.stop()
                            popoutWindow.networkExpanded = true
                        } else {
                            networkCloseTimer.restart()
                        }
                    }
                }

                // Arch logo
                Text {
                    text: ""
                    color: Theme.foreground
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.font.title
                }
            }
        }
    }
}
