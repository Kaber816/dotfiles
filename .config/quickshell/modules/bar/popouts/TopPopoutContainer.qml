import Quickshell
import QtQuick
import QtQuick.Shapes
import qs.theme

Item {
    id: root
    property bool expanded: false
    property bool hovered: mouse.hovered
    property int cornerRadius: Theme.globalRadius
    property int expandedHeight: 200
    default property alias content: contentSlot.data

    width: popoutWidth
    property int popoutWidth: 200
    height: expandedHeight + cornerRadius

    HoverHandler { id: mouse }

   // NOTES: Can align shapepath with borders by drawing it at width - strokeWidth/2 or height - strokewidth/2 (perfectly centers on edge like a normal border does?)
    Shape {
        id: inverseCorners
        anchors.fill: containerRectangle
        preferredRendererType: Shape.CurveRenderer
        visible: containerRectangle.height >= root.cornerRadius
        ShapePath{
            fillColor: Theme.background
            strokeWidth: 2
            strokeColor: Theme.accent
            startX: -Theme.globalRadius
            startY: Theme.halfOfStrokeWidth
            //PathLine {x: -Theme.globalRadius; y: Theme.halfOfStrokeWidth }
            PathQuad {
                x: -Theme.halfOfStrokeWidth; y:Theme.globalRadius
                controlX: -Theme.halfOfStrokeWidth; controlY: Theme.halfOfStrokeWidth
            }
            PathLine {x: -Theme.halfOfStrokeWidth; y:containerRectangle.height - Theme.globalRadius}
            PathQuad {
                x: Theme.globalRadius; y: containerRectangle.height + Theme.halfOfStrokeWidth
                controlX: -Theme.halfOfStrokeWidth; controlY: containerRectangle.height + Theme.halfOfStrokeWidth
            }
            PathLine {x: containerRectangle.width - Theme.globalRadius; y: containerRectangle.height + Theme.halfOfStrokeWidth }
            PathQuad {
                x: containerRectangle.width + Theme.halfOfStrokeWidth; y: containerRectangle.height - Theme.globalRadius
                controlX: containerRectangle.width + Theme.halfOfStrokeWidth; controlY: containerRectangle.height
            }
            PathLine {x: containerRectangle.width + Theme.halfOfStrokeWidth; y: Theme.globalRadius}
            PathQuad {
                x: containerRectangle.width + Theme.globalRadius; y: Theme.halfOfStrokeWidth
                controlX: containerRectangle.width; controlY: Theme.halfOfStrokeWidth
            }
            PathLine {x: -Theme.globalRadius; y: Theme.halfOfStrokeWidth}
        }
        
    }

    Rectangle {
        id: containerRectangle
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        radius: root.cornerRadius
        color: Theme.background
        border.color: "transparent"
        border.width: 0
        width: root.popoutWidth
        clip: true
        height: root.expanded ? root.expandedHeight : 0

        Behavior on height {
            NumberAnimation {
                duration: root.expanded ? 350 : 300
                easing.type: root.expanded ? Easing.InCubic : Easing.OutBack
                easing.overshoot: 2
            }
        }

        Item {
            id: contentSlot
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                margins: 12
            }
            height: childrenRect.height
        }
    }

    Shape {
        id: outlineMask
        anchors.fill: containerRectangle
        preferredRendererType: Shape.CurveRenderer
        visible: containerRectangle.height >= root.cornerRadius
        ShapePath {
            fillColor: Theme.background
            strokeWidth: Theme.strokeWidth
            strokeColor: Theme.background
            startX: Theme.halfOfStrokeWidth; startY: Theme.globalRadius
            PathQuad {
                x: -Theme.globalRadius; y: -Theme.halfOfStrokeWidth
                controlX: Theme.halfOfStrokeWidth; controlY: -Theme.halfOfStrokeWidth
            }
            PathLine { x: containerRectangle.width + Theme.globalRadius; y: -Theme.halfOfStrokeWidth }
            PathQuad {
                x: containerRectangle.width - Theme.halfOfStrokeWidth; y: Theme.globalRadius
                controlX: containerRectangle.width - Theme.halfOfStrokeWidth; controlY: -Theme.halfOfStrokeWidth
            }
            PathLine { x: Theme.halfOfStrokeWidth; y: Theme.globalRadius }
        }
    }
}
