import Quickshell
import Quickshell.Networking
import QtQuick
import QtQuick.Shapes
import QtQuick.Layouts
import qs.theme

Item {
    id: root
    property bool expanded: false
    property bool hovered: mouse.hovered
    property int cornerRadius: 16
    property int expandedHeight: contentColumn.implicitHeight + 24

    width: 200
    height: expandedHeight + cornerRadius

    property var wifiDevice: {
        const devices = Networking.devices.values
        return devices.find(d => d.type === DeviceType.Wifi) ?? null
    }
    property var wiredDevice: {
        const devices = Networking.devices.values
        return devices.find(d => d.type === DeviceType.Wired) ?? null
    }

    HoverHandler { id: mouse }

    Shape {
        id: inverseCorners
        anchors.fill: containerRectangle
        preferredRendererType: Shape.CurveRenderer
        visible: containerRectangle.height >= root.cornerRadius
        ShapePath {
            fillColor: Theme.background
            strokeWidth: 1.5
            strokeColor: Theme.accent
            startX: -root.cornerRadius; startY: 1.5
            PathQuad {
                x: -2; y: root.cornerRadius
                controlX: -2; controlY: 1.5
            }
            PathLine { x: -2; y: containerRectangle.height - root.cornerRadius }
            PathQuad {
                x: root.cornerRadius; y: containerRectangle.height + 2
                controlX: -2; controlY: containerRectangle.height + 2
            }
            PathLine { x: containerRectangle.width - root.cornerRadius; y: containerRectangle.height + 2 }
            PathQuad {
                x: containerRectangle.width + 2; y: containerRectangle.height - root.cornerRadius
                controlX: containerRectangle.width + 2; controlY: containerRectangle.height + 2
            }
            PathLine { x: containerRectangle.width + 2; y: root.cornerRadius }
            PathQuad {
                x: containerRectangle.width + root.cornerRadius; y: 1.5
                controlX: containerRectangle.width + 2; controlY: 1.5
            }
        }
    }

    Rectangle {
        id: containerRectangle
        anchors.horizontalCenter: parent.horizontalCenter
        radius: root.cornerRadius
        color: Theme.background
        border.color: "transparent"
        border.width: 0
        width: root.width
        clip: true
        height: root.expanded ? root.expandedHeight : 0

        Behavior on height {
            NumberAnimation {
                duration: root.expanded ? 350 : 300
                easing.type: root.expanded ? Easing.InCubic : Easing.OutBack
                easing.overshoot: 1.5
            }
        }

        Column {
            id: contentColumn
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                margins: 12
            }
            spacing: 10

            // Wifi
            Column {
                width: parent.width
                spacing: 4
                visible: root.wifiDevice !== null

                Text {
                    text: "󰖩  WiFi"
                    color: Theme.accent
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.font.small
                }

                Text {
                    text: Networking.wifiEnabled ? "Enabled" : "Disabled"
                    color: Theme.foreground
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.font.normal
                    font.weight: Font.Medium
                }
            }

            // Divider
            Rectangle {
                visible: root.wifiDevice !== null && root.wiredDevice !== null
                width: parent.width
                height: 1
                color: Theme.accent
                opacity: 0.2
            }

            // Wired
            Column {
                width: parent.width
                spacing: 4
                visible: root.wiredDevice !== null

                Text {
                    text: "󰈀  Wired"
                    color: Theme.accent
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.font.small
                }

                Text {
                    text: "Connected"
                    color: Theme.foreground
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.font.normal
                    font.weight: Font.Medium
                }
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
            PathLine { x: containerRectangle.width + root.cornerRadius; y: 0 }
            PathLine { x: containerRectangle.width - 5; y: 5 }
            PathLine { x: 5; y: 5 }
            PathLine { x: -root.cornerRadius; y: 0 }
        }
    }
}
