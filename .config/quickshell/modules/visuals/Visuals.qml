import Quickshell
import QtQuick
import QtQuick.Shapes
import qs.theme

Item {
    id: root
    anchors.fill: parent

    property color walColor: Theme.wal?.colors?.color8 ?? "#444444"
    property color bgColor: Qt.darker(walColor, 5.0)

    // Tuning variables
    property int topBarHeight: 45
    property int borderWidth: 15
    property int cornerRadius: 10
    property int br: borderWidth + cornerRadius

    // Gap tuning
    property int gapCenterOffset: 600  // distance from center to each gap
    property int gapInset: 40
    property int gapHandle: 80
    property int gapHandleOuter: 90

    // Derived gap positions
    property int gapLeft: (root.parent.width / 2) - gapCenterOffset
    property int gapRight: (root.parent.width / 2) + gapCenterOffset

    // Island tuning
    property int islandHalfWidth: 190
    property int islandCurveHandle: 150
    property int islandCornerRadius: 10

    Shape {
        anchors.fill: parent
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            fillColor: root.bgColor
            strokeWidth: 0
            strokeColor: "transparent"

            startX: 0
            startY: 0

            // Top edge left section up to gap
            PathLine {
                x: gapLeft - gapInset
                y: 0
            }

            // Gap curve down-left
            PathQuad {
                x: gapLeft - gapHandle
                y: root.topBarHeight - cornerRadius
                controlX: gapLeft - gapHandle
                controlY: 0
            }
            PathQuad {
                x: gapLeft - gapHandleOuter
                y: root.topBarHeight
                controlX: gapLeft - gapHandle
                controlY: root.topBarHeight
            }

            // Inner top edge left
            PathLine {
                x: br
                y: root.topBarHeight
            }

            // Top-left inner corner
            PathQuad {
                x: borderWidth
                y: root.topBarHeight + cornerRadius
                controlX: borderWidth
                controlY: root.topBarHeight
            }

            // Left border going down
            PathLine {
                x: borderWidth
                y: root.parent.height - br
            }

            // Bottom-left inner corner
            PathQuad {
                x: br
                y: root.parent.height - borderWidth
                controlX: borderWidth
                controlY: root.parent.height - borderWidth
            }

            // Bottom edge
            PathLine {
                x: root.parent.width - br
                y: root.parent.height - borderWidth
            }

            // Bottom-right inner corner
            PathQuad {
                x: root.parent.width - borderWidth
                y: root.parent.height - br
                controlX: root.parent.width - borderWidth
                controlY: root.parent.height - borderWidth
            }

            // Right border going up
            PathLine {
                x: root.parent.width - borderWidth
                y: root.topBarHeight + cornerRadius
            }

            // Top-right inner corner
            PathQuad {
                x: root.parent.width - br
                y: root.topBarHeight
                controlX: root.parent.width - borderWidth
                controlY: root.topBarHeight
            }

            // Inner top edge right
            PathLine {
                x: gapRight + gapHandleOuter
                y: root.topBarHeight
            }

            // Gap curve up-right
            PathQuad {
                x: gapRight + gapHandle
                y: root.topBarHeight - cornerRadius
                controlX: gapRight + gapHandle
                controlY: root.topBarHeight
            }
            PathQuad {
                x: gapRight + gapInset
                y: 0
                controlX: gapRight + gapHandle
                controlY: 0
            }

            // Top edge right section
            PathLine {
                x: root.parent.width
                y: 0
            }

            // Outer boundary
            PathLine {
                x: root.parent.width
                y: root.parent.height
            }
            PathLine {
                x: 0
                y: root.parent.height
            }
            PathLine {
                x: 0
                y: 0
            }
        }
    }

    // Center clock island
    Shape {
        anchors.fill: parent
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            fillColor: root.bgColor
            strokeWidth: 0
            strokeColor: "transparent"

            startX: (root.parent.width / 2) - islandHalfWidth
            startY: 0

            // Top edge
            PathLine {
                x: (root.parent.width / 2) + islandHalfWidth
                y: 0
            }

            // Right curve down
            PathQuad {
                x: (root.parent.width / 2) + islandCurveHandle
                y: root.topBarHeight - islandCornerRadius
                controlX: (root.parent.width / 2) + islandCurveHandle
                controlY: 0
            }
            PathQuad {
                x: (root.parent.width / 2) + islandCurveHandle - islandCornerRadius
                y: root.topBarHeight
                controlX: (root.parent.width / 2) + islandCurveHandle
                controlY: root.topBarHeight
            }

            // Bottom edge
            PathLine {
                x: (root.parent.width / 2) - islandCurveHandle + islandCornerRadius
                y: root.topBarHeight
            }

            // Left curve up
            PathQuad {
                x: (root.parent.width / 2) - islandCurveHandle
                y: root.topBarHeight - islandCornerRadius
                controlX: (root.parent.width / 2) - islandCurveHandle
                controlY: root.topBarHeight
            }
            PathQuad {
                x: (root.parent.width / 2) - islandHalfWidth
                y: 0
                controlX: (root.parent.width / 2) - islandCurveHandle
                controlY: 0
            }
        }
    }
}
