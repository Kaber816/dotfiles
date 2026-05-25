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

            PanelWindow {
                screen: modelData
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

            // Top bar reservation and contents
            PanelWindow {
                screen: modelData
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
                            monitor: modelData
                        }
                    }

                    // Center item
                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        ClockWidget {
                            anchors.centerIn: parent
                        }
                    }

                    // Right item
                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        StatusGroup {
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
            }
            
            // Right bar reservation
            PanelWindow {
                screen: modelData
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
                screen: modelData
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
                screen: modelData
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
