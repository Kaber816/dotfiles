import Quickshell
import QtQuick
import QtQuick.Shapes
import QtQuick.Layouts
import qs.theme
Item {
    id: root
    property bool expanded: false
    property bool hovered: mouse.hovered
    property int cornerRadius: 20
    property int expandedHeight: 400
    width: 600
    height: expandedHeight + cornerRadius

    HoverHandler {
        id: mouse
    }

    Shape {
        id: inverseCorners
        anchors.fill: containerRectangle
        preferredRendererType: Shape.CurveRenderer
        visible: containerRectangle.height >= root.cornerRadius

        // Top-left inverse corner
        ShapePath {
            fillColor: Theme.background
            strokeWidth: 2
            strokeColor: Theme.accent
            startX: -root.cornerRadius; startY: 0

            PathLine { x: root.cornerRadius + 10; y: 0 }
            PathLine { x: 0; y: root.cornerRadius }
            PathQuad {
                x: -root.cornerRadius
                y: 0
                controlX: 0
                controlY: 0
            }
        }

        // Top-right inverse corner
        ShapePath {
            fillColor: Theme.background
            strokeWidth: 2
            strokeColor: Theme.accent
            startX: containerRectangle.width + root.cornerRadius; startY: 0

            PathLine {
                x: containerRectangle.width - root.cornerRadius - 10
                y: 0
            }

            PathLine {
                x: containerRectangle.width
                y: root.cornerRadius
            }

            PathQuad {
                x: containerRectangle.width + root.cornerRadius
                y: 0
                controlX: containerRectangle.width
                controlY: 0
            }
        }
    }

    Rectangle {
        id: containerRectangle
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 20
        color: Theme.background
        border.color: Theme.accent
        border.width: 1.5
        width: 600
        clip: true
        height: root.expanded ? root.expandedHeight : 0

        Behavior on height {
            NumberAnimation {
                duration: root.expanded ? 350: 400
                easing.type: root.expanded ? Easing.InCubic : Easing.OutBack
                easing.overshoot: 1.5
            }
        }
    }

    Shape {
        id: outlineMask
        anchors.fill: containerRectangle
        preferredRendererType: Shape.CurveRenderer
        visible: containerRectangle.height >= root.cornerRadius

        ShapePath {
            fillColor: Theme.background
            strokeWidth: 0
            strokeColor: Theme.background

            startX: 0; startY: 1.5
            PathLine { x: containerRectangle.width; y: 1.5 }
            PathLine { x: containerRectangle.width - 2; y: root.cornerRadius }
            PathLine { x: 2; y: root.cornerRadius }
        }
    }
}
