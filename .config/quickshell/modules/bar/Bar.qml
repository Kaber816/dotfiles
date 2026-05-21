// Bar.qml
import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import qs.modules.bar.components
import qs.theme
import qs.modules.visuals

Scope {
    id: root
    Variants {
        model: Quickshell.screens

        // Wrap both windows in a Scope so they share one modelData per screen
        Scope {
            required property ShellScreen modelData
            
            // Visual Panel Window for top and other bars, just draws the shape around the screen
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
                Visuals {}
            }
            
            // Top Bar Space Reserving and Content
            PanelWindow {
                screen: modelData
                color: "transparent"
                implicitHeight: 45
                WlrLayershell.layer: WlrLayer.Top

                anchors {
                    top: true
                    left: true
                    right: true
                }
                
                // Top Bar RowLayout
                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Workspaces {
                            anchors.verticalCenter: parent.verticalCenter
                            monitor: modelData
                        }
                    }
                    Item {
                        Layout.fillHeight: true
                        ClockWidget {
                            anchors.centerIn: parent
                        }
                    }
                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                }
            }
            
            // Right side bar content and space reservation
            PanelWindow {
                screen: modelData
                color: "transparent"
                implicitWidth: 10
                WlrLayershell.layer: WlrLayer.Top

                anchors {
                    top: true
                    bottom: true
                    right: true
                }
            }

            // Left side bar content and space reservation
            PanelWindow {
                screen: modelData
                color: "transparent"
                implicitWidth: 10
                WlrLayershell.layer: WlrLayer.Top

                anchors {
                    top: true
                    bottom: true
                    left: true
                }
            }

            // Bottom bar content and space reservation
            PanelWindow {
                screen: modelData
                color: "transparent"
                implicitHeight: 10
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
