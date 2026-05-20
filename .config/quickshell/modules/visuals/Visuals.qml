import Quickshell
import QtQuick
import QtQuick.Shapes
import Quickshell.Wayland
import qs.theme

Item {
    anchors.fill: parent
    clip: false

    property real curveRadius: 40

    property color walColor:
        Theme.wal?.colors?.color8 ?? "#444444"

    property color bgColor:
        Qt.darker(walColor, 5.0)

    Shape {
        id: bgShape

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        height: 80
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            fillColor: bgColor

            strokeWidth: 0
            strokeColor: Theme.foreground

            startX: 0
            startY: 0

            PathLine {
                x: bgShape.width
                y: 0
            }

            PathLine {
                x: bgShape.width
                y: bgShape.height
            }

            PathQuad {
                x: bgShape.width - curveRadius
                y: bgShape.height - curveRadius

                controlX: bgShape.width
                controlY: bgShape.height - curveRadius
            }

            PathLine {
                x: curveRadius
                y: bgShape.height - curveRadius
            }

            PathQuad {
                x: 0
                y: bgShape.height

                controlX: 0
                controlY: bgShape.height - curveRadius
            }

            PathLine {
                x: 0
                y: 0
            }
        }
    }
}
