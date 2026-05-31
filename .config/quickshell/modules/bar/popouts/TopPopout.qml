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
            strokeWidth: 1.5
            strokeColor: Theme.accent
            startX: -root.cornerRadius; startY: 1.5
            PathQuad {
                x: -2
                y: root.cornerRadius
                controlX: -2
                controlY: 1.5
            }
            PathLine { x: -2; y: containerRectangle.height - root.cornerRadius}
            PathQuad {
                x: root.cornerRadius
                y: containerRectangle.height + 2
                controlX: -2
                controlY: containerRectangle.height + 2
            }
            PathLine { x: containerRectangle.width - root.cornerRadius; y: containerRectangle.height + 2 }
            PathQuad {
                x: containerRectangle.width + 2
                y: containerRectangle.height - root.cornerRadius
                controlX: containerRectangle.width + 2
                controlY: containerRectangle.height + 2
            }
            PathLine { x: containerRectangle.width + 2; y: root.cornerRadius}
            PathQuad {
                x: containerRectangle.width + root.cornerRadius
                y: 1.5
                controlX: containerRectangle.width + 2
                controlY: 1.5
            }
        }
    }

    Rectangle {
        id: containerRectangle
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 20
        color: Theme.background
        border.color: "transparent"
        border.width: 0
        width: 600
        clip: true
        height: root.expanded ? root.expandedHeight : 0

        Behavior on height {
            NumberAnimation {
                duration: root.expanded ? 350: 300
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

            startX: -root.cornerRadius; startY: 0
            PathLine { x: containerRectangle.width + root.cornerRadius; y: 0}
            PathLine { x: containerRectangle.width - 5; y: 5}
            PathLine { x: 5; y: 5}
            PathLine { x: -root.cornerRadius; y: 0}
        }
    }
}
