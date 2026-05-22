import Quickshell
import QtQuick
import QtQuick.Shapes
import Quickshell.Wayland
import qs.theme

Item {
    id: root
    anchors.fill: parent

    property int topBarHeight: 45
    property int borderWidth: 15
    property int cornerRadius: 8
    property int br: borderWidth + cornerRadius

    property color lightThreshold: "#1d0c0b"
    property color color0: Theme.wal.colors.color0 ?? "#000000"
    property color thresholdColor: lightThreshold
    property bool isLight: color0 > lightThreshold

    property color bgColor: isLight
        ? Qt.darker(Theme.wal.colors.color6, 1.0) ?? "#ffffff"
        : Qt.darker(Theme.wal.colors.color4, 4.0) ?? "#111111" 
    

    Shape {
        id: bgShape
        anchors.fill: parent
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            fillColor: root.bgColor
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
    }
}
