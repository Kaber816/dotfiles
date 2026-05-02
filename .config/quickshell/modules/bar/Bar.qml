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
            required property var modelData
            screen: modelData

            color: "transparent" // This is so we can use rounded rectangle edges

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 80

            Shape {
                width: parent.width
                height: parent.height

                ShapePath {
                    fillColor: Theme.background
                    strokeWidth: 4
                    strokeColor: Theme.wal.colors.color1
 
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

            Rectangle { // Allows for rounded bar by using transparent panelWindow (still need panelWindow to reserve space)
                width: parent.width
                anchors.top: parent.top

                implicitHeight: 40
                color: "transparent"

                RowLayout {
                    anchors {
                        fill: parent
                        rightMargin: 10
                        leftMargin: 10
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
