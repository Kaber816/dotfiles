import Quickshell
import QtQuick
import QtQuick.Shapes
import QtQuick.Layouts
import qs.theme

Item {
    id: root

    property bool expanded: false
    property int cr: 20
    property int expandedHeight: 400

    width: 600
    height: expandedHeight + cr

    Shape {
        id: inverseCorners

        anchors.fill: containerRectangle
        preferredRendererType: Shape.CurveRenderer
        visible: containerRectangle.height >= root.cr

        // Top-left inverse corner
        ShapePath {
            fillColor: Theme.background
            strokeWidth: 1.5
            strokeColor: Theme.accent

            startX: -root.cr; startY: 0
            PathLine { x: root.cr + 10; y: 0 }
            PathLine { x: 0; y: root.cr }
            PathQuad {
                x: -root.cr
                y: 0
                controlX: 0
                controlY: 0
            }
        }

        // Top-right inverse corner
        ShapePath {
            fillColor: Theme.background
            strokeWidth: 1.5
            strokeColor: Theme.accent

            startX: containerRectangle.width + root.cr; startY: 0
            PathLine {
                x: containerRectangle.width - root.cr - 10
                y: 0
            }
            PathLine {
                x: containerRectangle.width
                y: root.cr
            }
            PathQuad {
                x: containerRectangle.width + root.cr
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
                duration: 300
                easing.type: root.expanded ? Easing.OutCubic : Easing.InCubic
            }
        }

    }

}
