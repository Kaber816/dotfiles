import QtQuick
import QtQuick.Shapes
import qs.modules.bar
import qs.theme

Item {
    id: root
    anchors.fill: parent

    property int cornerRadius: BarSettings.radius
    property int cornerCurveStart: BarSettings.screenBorderWidth + cornerRadius

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

            PathMove { x: root.cornerCurveStart; y: BarSettings.topBarHeight }

            PathLine { x: root.parent.width - root.cornerCurveStart; y: BarSettings.topBarHeight }
            PathQuad {
                x: root.parent.width - BarSettings.screenBorderWidth
                y: BarSettings.topBarHeight + root.cornerRadius
                controlX: root.parent.width - BarSettings.screenBorderWidth
                controlY: BarSettings.topBarHeight
            }
            PathLine { x: root.parent.width - BarSettings.screenBorderWidth; y: root.parent.height - cornerCurveStart }
            PathQuad {
                x: root.parent.width - root.cornerCurveStart
                y: root.parent.height - BarSettings.screenBorderWidth
                controlX: root.parent.width - BarSettings.screenBorderWidth
                controlY: root.parent.height - BarSettings.screenBorderWidth
            }
            PathLine { x: root.cornerCurveStart; y: root.parent.height - BarSettings.screenBorderWidth }
            PathQuad {
                x: BarSettings.screenBorderWidth
                y: root.parent.height - root.cornerCurveStart
                controlX: BarSettings.screenBorderWidth
                controlY: root.parent.height - BarSettings.screenBorderWidth
            }
            PathLine { x: BarSettings.screenBorderWidth; y: BarSettings.topBarHeight + root.cornerRadius }
            PathQuad {
                x: root.cornerCurveStart
                y: BarSettings.topBarHeight
                controlX: BarSettings.screenBorderWidth
                controlY: BarSettings.topBarHeight
            }
        }
        
        // Accent color that goes around inside part of border
        ShapePath {
            fillColor: "transparent"
            strokeWidth: 2
            strokeColor: Theme.accent

            startX: root.cornerCurveStart
            startY: BarSettings.topBarHeight

            PathLine { x: root.parent.width - root.cornerCurveStart; y: BarSettings.topBarHeight }
            PathQuad {
                x: root.parent.width - BarSettings.screenBorderWidth
                y: BarSettings.topBarHeight + root.cornerRadius
                controlX: root.parent.width - BarSettings.screenBorderWidth
                controlY: BarSettings.topBarHeight
            }
            PathLine { x: root.parent.width - BarSettings.screenBorderWidth; y: root.parent.height - root.cornerCurveStart }
            PathQuad {
                x: root.parent.width - root.cornerCurveStart
                y: root.parent.height - BarSettings.screenBorderWidth
                controlX: root.parent.width - BarSettings.screenBorderWidth
                controlY: root.parent.height - BarSettings.screenBorderWidth
            }
            PathLine { x: root.cornerCurveStart; y: root.parent.height - BarSettings.screenBorderWidth }
            PathQuad {
                x: BarSettings.screenBorderWidth
                y: root.parent.height - root.cornerCurveStart
                controlX: BarSettings.screenBorderWidth
                controlY: root.parent.height - BarSettings.screenBorderWidth
            }
            PathLine { x: BarSettings.screenBorderWidth; y: BarSettings.topBarHeight + root.cornerRadius }
            PathQuad {
                x: root.cornerCurveStart
                y: BarSettings.topBarHeight
                controlX: BarSettings.screenBorderWidth
                controlY: BarSettings.topBarHeight
            }
        }

    }
}
