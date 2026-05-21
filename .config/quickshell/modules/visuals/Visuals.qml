import Quickshell
import QtQuick
import QtQuick.Shapes
import Quickshell.Wayland
import qs.theme

Item {
    id: root
    anchors.fill: parent

    property color walColor:
        Theme.wal?.colors?.color8 ?? "#444444"

    property color bgColor: Qt.darker(walColor, 5.0)

    property int topBarHeight: 45

    Shape {
        anchors.fill: parent
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            fillColor: root.bgColor
            strokeWidth: 0
            strokeColor: "transparent"

            startX: 0
            startY: 0

            PathLine {
                x: (root.parent.width / 4) - 40
                y: 0
            }


            PathQuad {
                x: (root.parent.width / 4) - 80
                y: root.topBarHeight - 10

                controlX: (root.parent.width / 4) - 80
                controlY: 0
            }

            PathQuad {
                x: (root.parent.width / 4) - 90
                y: root.topBarHeight

                controlX: (root.parent.width / 4) - 80
                controlY: root.topBarHeight
            }

            PathLine {
                x: 20
                y: root.topBarHeight
            }

            PathQuad {
                x: 10
                y: root.topBarHeight + 10

                controlX: 10
                controlY: root.topBarHeight
            }

            PathLine {
                x: 10
                y: root.parent.height - 20
            }

            PathQuad {
                x: 20
                y: root.parent.height - 10

                controlX: 10
                controlY: root.parent.height - 10
            }

            PathLine {
                x: root.parent.width - 20
                y: root.parent.height - 10
            }

            PathQuad {
                x: root.parent.width - 10
                y: root.parent.height - 20

                controlX: root.parent.width - 10
                controlY: root.parent.height - 10
            }

            PathLine {
                x: root.parent.width - 10
                y: root.topBarHeight + 10
            }

            PathQuad {
                x: root.parent.width - 20
                y: root.topBarHeight

                controlX: root.parent.width - 10
                controlY: root.topBarHeight
            }

            PathLine {
                x: (root.parent.width * (3 / 4)) + 90
                y: root.topBarHeight
            }

            PathQuad {
                x: (root.parent.width * (3 / 4)) + 80
                y: root.topBarHeight - 10

                controlX: (root.parent.width * (3 / 4)) + 80
                controlY: root.topBarHeight
            }

            PathQuad {
                x: (root.parent.width * (3 / 4)) + 40
                y: 0

                controlX: (root.parent.width * (3 / 4)) + 80
                controlY: 0
            }

            PathLine {
                x: root.parent.width
                y: 0
            }

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

    Shape {
        anchors.fill: parent
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            fillColor: root.bgColor
            strokeWidth: 0
            strokeColor: "transparent"
 
            startX: (root.parent.width / 2) - 200
            startY: 0

            PathLine {
                x: (root.parent.width / 2) + 200
                y: 0
            }

            PathQuad {
                x: (root.parent.width / 2) + 160
                y: root.topBarHeight - 10

                controlX: (root.parent.width / 2) + 160
                controlY: 0
            }

            PathQuad {
                x: (root.parent.width / 2) + 150
                y: root.topBarHeight

                controlX: (root.parent.width / 2) + 160
                controlY: root.topBarHeight
            }
            
            PathLine {
                x: (root.parent.width / 2) - 150
                y: root.topBarHeight
            }

            PathQuad {
                x: (root.parent.width / 2) - 160
                y: root.topBarHeight - 10

                controlX: (root.parent.width / 2) - 160
                controlY: root.topBarHeight
            }

            PathQuad {
                x: (root.parent.width / 2) - 200
                y: 0

                controlX: (root.parent.width / 2) - 160
                controlY: 0
            }
        }
    }
}
