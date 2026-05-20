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

            PanelWindow {
                screen: modelData
                color: "transparent"
                implicitHeight: 40
                WlrLayershell.layer: WlrLayer.Top

                anchors {
                    top: true
                    left: true
                    right: true
                }

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
        }
    }
}
