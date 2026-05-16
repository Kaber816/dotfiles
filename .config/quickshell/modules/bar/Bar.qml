import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import qs.modules.bar.components
import qs.theme

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property ShellScreen modelData
            screen: modelData
            color: "transparent" // This is so we can use rounded rectangle edges
            implicitHeight: 80
            anchors { 
                top: true
                left: true
                right: true 
            }

            Shape {
                width: parent.width
                height: parent.height
                preferredRendererType: Shape.CurveRenderer

                ShapePath {
                    fillColor: Qt.darker(Theme.wal.colors.color8, 5.0)
                    strokeWidth: 0
                    strokeColor: Theme.foreground

                    startX: 0; startY: 0

                    PathLine { x: width; y: 0 }
                    PathLine { x: width; y: height }
                    PathQuad { 
                        x: width - 40 
                        y: height - 40
                        controlX: width
                        controlY: height - 40
                    }
                    PathLine { x: 40; y: height - 40 }
                    PathQuad { 
                        x: 0 
                        y: height
                        controlX: 0
                        controlY: height - 40
                    }
                    PathLine { x: 0; y: 0 }
                }
            }

            // Allows for rounded bar by using transparent panelWindow (still need panelWindow to reserve space),
            //shape is for drawing actual bar with rounded corners
            Rectangle { 
                width: parent.width
                anchors.top: parent.top

                implicitHeight: 40
                color: "transparent"

                RowLayout {
                    anchors {
                        fill: parent
                        leftMargin: 20
                        rightMargin: 20
                        centerIn: parent
                    }

                    Workspaces {
                        monitor: modelData
                    }

                    ClockWidget {
                        Layout.fillHeight: false
                        Layout.alignment: Qt.AlignCenter
                    }


                }
            }
        }
    }
}
