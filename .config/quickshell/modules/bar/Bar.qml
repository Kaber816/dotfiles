import Quickshell 
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import qs.modules.bar.components
import qs.modules.bar.popouts
import qs.theme

Scope {
    id: root
    Variants {
        model: Quickshell.screens

        Scope {
            id: barScope
            required property ShellScreen modelData
            property int borderWidth: 12
            property int topBarHeight: 45

            // Background
            PanelWindow {
                screen: barScope.modelData
                color: "transparent"
                WlrLayershell.layer: WlrLayer.Bottom
                WlrLayershell.exclusionMode: ExclusionMode.Ignore

                anchors {
                    top: true
                    left: true
                    right: true
                    bottom: true
                }

                Background {}

            }
            
            // Popouts
            PanelWindow {
                id: popoutWindow
                screen: barScope.modelData
                color: "transparent"
                WlrLayershell.layer: WlrLayer.Top
                WlrLayershell.exclusionMode: ExclusionMode.Ignore

                anchors {
                    top: true
                    left: true
                    right: true
                    bottom: true
                }

                mask: Region {
                    x: topCenterPopout.x
                    y: topCenterPopout.y
                    width: topCenterPopout.expanded ? topCenterPopout.width: 0
                    height: topCenterPopout.expanded ? topCenterPopout.height : 0

                    Region {
                        x: networkPopout.x
                        y: networkPopout.y
                        width: networkPopout.expanded ? networkPopout.width : 0
                        height: networkPopout.expanded ? networkPopout.height : 0
                    }
                }

                // TOP POPOUT LOGIG
                TopCenterPopout {
                    id: topCenterPopout
                    anchors {
                        top: parent.top
                        topMargin: barScope.topBarHeight - 1.5
                        horizontalCenter: parent.horizontalCenter
                    }
                    expanded: centerHover.hovered || topCenterPopout.hovered
                }

                // - NETWORK POPOUT LOGIC
                property bool networkExpanded: false

                Timer {
                    id: networkCloseTimer
                    interval: 80
                    onTriggered: popoutWindow.networkExpanded = false
                }

                NetworkPopout {
                    id: networkPopout

                    anchors {
                        top: parent.top
                        topMargin: barScope.topBarHeight - 1.5
                        right: parent.right
                        rightMargin: 65
                    }
                    expanded: popoutWindow.networkExpanded

                    HoverHandler {
                        onHoveredChanged: {
                            if (hovered) {
                                networkCloseTimer.stop()
                            } else {
                                networkCloseTimer.restart()
                            }
                        }
                    }
                }

            }

            // Top bar reservation and contents
            PanelWindow {
                screen: barScope.modelData
                color: "transparent"
                implicitHeight: barScope.topBarHeight
                WlrLayershell.layer: WlrLayer.Top
                anchors {
                    top: true
                    left: true
                    right: true
                }

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

            // Right bar reservation
            PanelWindow {
                screen: barScope.modelData
                color: "transparent"
                implicitWidth: barScope.borderWidth
                WlrLayershell.layer: WlrLayer.Top
                anchors {
                    top: true
                    bottom: true
                    right: true
                }
            }

            // Left bar reservation
            PanelWindow {
                screen: barScope.modelData
                color: "transparent"
                implicitWidth: barScope.borderWidth
                WlrLayershell.layer: WlrLayer.Top
                anchors {
                    top: true
                    bottom: true
                    left: true
                }
            }

            // Bottom bar reservation
            PanelWindow {
                screen: barScope.modelData
                color: "transparent"
                implicitHeight: barScope.borderWidth
                WlrLayershell.layer: WlrLayer.Top
                anchors {
                    bottom: true
                    left: true
                    right: true
                }
            }
        }
    }
}
