import Quickshell
import QtQuick
import QtQuick.Shapes
import Quickshell.Wayland
import qs.theme

Item {
    id: root
    anchors.fill: parent

    property color walColor:
        Theme.wal?.colors?.color8 ?? "#444444"

    property color bgColor:
        Qt.darker(walColor, 5.0)

    property int topBarHeight: 40

    Shape {
        id: bgShape

        anchors.fill: parent

        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            fillColor: root.bgColor

            strokeWidth: 0
            strokeColor: Theme.foreground

            startX: 0
            startY: 0

            PathLine {
                x: root.parent.width
                y: 0
            }

            PathLine {
                x: root.parent.width
                y: root.parent.height
            }

            PathLine {
                x: root.parent.width
                y: root.parent.height
            }

            PathLine {
                x: 0
                y: root.parent.height
            }

            PathLine {
                x: 0
                y: 0
            }
            
            PathMove {
                x: 20
                y: root.topBarHeight
            }

            PathLine {
                x: root.parent.width - 20
                y: root.topBarHeight
            }

            PathQuad {
                x: root.parent.width - 10
                y: root.topBarHeight + 10

                controlX: root.parent.width - 10
                controlY: root.topBarHeight
            }

            PathLine {
                x: root.parent.width - 10 
                y: root.parent.height - 20
            }

            PathQuad {
                x: root.parent.width - 20
                y: root.parent.height - 10
                
                controlX: root.parent.width - 10
                controlY: root.parent.height - 10
            }

            PathLine {
                x: 20
                y: root.parent.height - 10
            }

            PathQuad {
                x: 10
                y: root.parent.height - 20

                controlX: 10
                controlY: root.parent.height - 10
            }

            PathLine {
                x: 10
                y: root.topBarHeight + 10
            }

            PathQuad {
                x: 20
                y: root.topBarHeight

                controlX:10
                controlY: root.topBarHeight 
            }
        }
    }
}
