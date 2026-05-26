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

    Rectangle {
        id: containerRectangle

        anchors.horizontalCenter: parent.horizontalCenter

        radius: 20
        color: Theme.background

        width: 600
        height: root.expanded ? root.expandedHeight : 0

        clip: true

        Behavior on height {
            NumberAnimation {
                duration: root.expanded ? 80 : 300
                easing.type: root.expanded ? Easing.OutCubic : Easing.InCubic
            }
        }
    }

    Shape {
        id: inverseCorners

        anchors.fill: containerRectangle
        preferredRendererType: Shape.CurveRenderer

        // Top-left inverse corner
        ShapePath {
            fillColor: Theme.background
            strokeWidth: 0
            strokeColor: "transparent"

            startX: -root.cr
            startY: 0

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
            strokeWidth: 0
            strokeColor: "transparent"

            startX: containerRectangle.width + root.cr
            startY: 0

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
}
