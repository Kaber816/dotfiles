import Quickshell
import QtQuick
import QtQuick.Shapes
import Quickshell.Wayland
import qs.theme

Item {
    id: root
    anchors.fill: parent

    property int topBarHeight: 45
    property int borderWidth: 12
    property int cornerRadius: 20
    property int br: borderWidth + cornerRadius

    Shape {
        id: bgShape
        anchors.fill: parent
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            fillColor: Theme.background
            strokeWidth: 0
            strokeColor: "transparent"

            startX: 0
            startY: 0

            PathLine { x: root.parent.width; y: 0 }
            PathLine { x: root.parent.width; y: root.parent.height }
            PathLine { x: 0; y: root.parent.height }
            PathLine { x: 0; y: 0 }

            PathMove { x: br; y: root.topBarHeight }

            PathLine { x: root.parent.width - br; y: root.topBarHeight }
            PathQuad {
                x: root.parent.width - borderWidth
                y: root.topBarHeight + cornerRadius
                controlX: root.parent.width - borderWidth
                controlY: root.topBarHeight
            }
            PathLine { x: root.parent.width - borderWidth; y: root.parent.height - br }
            PathQuad {
                x: root.parent.width - br
                y: root.parent.height - borderWidth
                controlX: root.parent.width - borderWidth
                controlY: root.parent.height - borderWidth
            }
            PathLine { x: br; y: root.parent.height - borderWidth }
            PathQuad {
                x: borderWidth
                y: root.parent.height - br
                controlX: borderWidth
                controlY: root.parent.height - borderWidth
            }
            PathLine { x: borderWidth; y: root.topBarHeight + cornerRadius }
            PathQuad {
                x: br
                y: root.topBarHeight
                controlX: borderWidth
                controlY: root.topBarHeight
            }
        }

        ShapePath {
            fillColor: "transparent"
            strokeWidth: 2
            strokeColor: Theme.accent

            startX: br
            startY: root.topBarHeight

            PathLine { x: root.parent.width - br; y: root.topBarHeight }
            PathQuad {
                x: root.parent.width - borderWidth
                y: root.topBarHeight + cornerRadius
                controlX: root.parent.width - borderWidth
                controlY: root.topBarHeight
            }
            PathLine { x: root.parent.width - borderWidth; y: root.parent.height - br }
            PathQuad {
                x: root.parent.width - br
                y: root.parent.height - borderWidth
                controlX: root.parent.width - borderWidth
                controlY: root.parent.height - borderWidth
            }
            PathLine { x: br; y: root.parent.height - borderWidth }
            PathQuad {
                x: borderWidth
                y: root.parent.height - br
                controlX: borderWidth
                controlY: root.parent.height - borderWidth
            }
            PathLine { x: borderWidth; y: root.topBarHeight + cornerRadius }
            PathQuad {
                x: br
                y: root.topBarHeight
                controlX: borderWidth
                controlY: root.topBarHeight
            }
        }

    }
}
