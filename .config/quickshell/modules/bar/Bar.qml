import Quickshell 
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import qs.modules.bar.components
import qs.theme

Scope {
    id: root
    Variants {
        model: Quickshell.screens
        Scope {
            id: barScope
            required property ShellScreen modelData
            property int borderWidth: 12
            property int topBarHeight: 40

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
                implicitHeight: barScope.topBarHeight
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

                    // Left
                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Workspaces {
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            monitor: modelData
                        }
                    }

                    // Center
                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        ClockWidget {
                            anchors.centerIn: parent
                        }
                    }

                    // Right
                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        Rectangle {
                            id: systemGroup
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            height: 35
                            radius: 10
                            color: Theme.backgroundSecondary
                            implicitWidth: groupRow.implicitWidth + 20

                            RowLayout {
                                id: groupRow
                                anchors.centerIn: parent
                                anchors.horizontalCenterOffset: 3
                                spacing: 12
                                
                                CpuTempWidget {}
                                CpuUsageWidget {}
                                AudioWidget {}
                            }
                        }
                    }
                }
            }

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
