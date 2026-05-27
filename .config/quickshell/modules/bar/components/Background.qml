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
            //fillColor: Qt.alpha(Theme.background, 0.90)
            fillColor: Theme.background
            strokeWidth: 0
            strokeColor: "transparent"

            startX: 0
            startY: 0

            PathLine { x: root.parent.width; y: 0 }
            PathLine { x: root.parent.width; y: root.parent.height }
            PathLine { x: 0; y: root.parent.height }
            PathLine { x: 0; y: 0 }

            PathMove { x: root.br; y: root.topBarHeight }

            PathLine { x: root.parent.width - root.br; y: root.topBarHeight }
            PathQuad {
                x: root.parent.width - root.borderWidth
                y: root.topBarHeight + root.cornerRadius
                controlX: root.parent.width - root.borderWidth
                controlY: root.topBarHeight
            }
            PathLine { x: root.parent.width - root.borderWidth; y: root.parent.height - br }
            PathQuad {
                x: root.parent.width - root.br
                y: root.parent.height - root.borderWidth
                controlX: root.parent.width - root.borderWidth
                controlY: root.parent.height - root.borderWidth
            }
            PathLine { x: root.br; y: root.parent.height - root.borderWidth }
            PathQuad {
                x: root.borderWidth
                y: root.parent.height - root.br
                controlX: root.borderWidth
                controlY: root.parent.height - root.borderWidth
            }
            PathLine { x: root.borderWidth; y: root.topBarHeight + root.cornerRadius }
            PathQuad {
                x: root.br
                y: root.topBarHeight
                controlX: root.borderWidth
                controlY: root.topBarHeight
            }
        }
        
        // Accent color that goes around inside part of border
        ShapePath {
            fillColor: "transparent"
            strokeWidth: 1.5
            strokeColor: Theme.accent

            startX: root.br
            startY: root.topBarHeight

            PathLine { x: root.parent.width - root.br; y: root.topBarHeight }
            PathQuad {
                x: root.parent.width - root.borderWidth
                y: root.topBarHeight + root.cornerRadius
                controlX: root.parent.width - root.borderWidth
                controlY: root.topBarHeight
            }
            PathLine { x: root.parent.width - root.borderWidth; y: root.parent.height - root.br }
            PathQuad {
                x: root.parent.width - root.br
                y: root.parent.height - root.borderWidth
                controlX: root.parent.width - root.borderWidth
                controlY: root.parent.height - root.borderWidth
            }
            PathLine { x: root.br; y: root.parent.height - root.borderWidth }
            PathQuad {
                x: root.borderWidth
                y: root.parent.height - root.br
                controlX: root.borderWidth
                controlY: root.parent.height - root.borderWidth
            }
            PathLine { x: root.borderWidth; y: root.topBarHeight + root.cornerRadius }
            PathQuad {
                x: root.br
                y: root.topBarHeight
                controlX: root.borderWidth
                controlY: root.topBarHeight
            }
        }

    }
}
