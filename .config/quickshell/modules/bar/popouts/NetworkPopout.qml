// NetworkPopout.qml
import Quickshell.Networking
import QtQuick
import QtQuick.Layouts
import qs.theme

TopPopoutContainer {
    id: root
    popoutWidth: 200
    expandedHeight: contentColumn.implicitHeight + 24

    property var wifiDevice: {
        const devices = Networking.devices.values
        return devices.find(d => d.type === DeviceType.Wifi) ?? null
    }
    property var wiredDevices: {
        const devices = Networking.devices.values
        return devices.filter(d => d.type === DeviceType.Wired)
    }

    ColumnLayout {
        id: contentColumn
        width: parent.width
        spacing: 10

        // Wifi
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 4
            // visible: root.wifiDevice !== null // (always visible)

            Text {
                text: "󰖩  WiFi"
                color: Theme.accent
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.small
            }

            Text {
                visible: toString(Networking.connectivity) == "None"
                color: Theme.foreground
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.normal
                font.weight: Font.Medium
                text: "No Networks Connected"
            }

            Repeater {
                model: root.wifiDevice.networks

                Column {
                    id: wifiNetworksCol
                    required property var modelData
                    spacing: 2

                    Text {
                        color: Theme.foreground
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.font.normal
                        font.weight: Font.Medium
                        text: wifiNetworksCol.modelData.name
                    }

                    Text {
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.font.small
                        color: Theme.foreground
                        opacity: 0.6
                        text: wifiNetworksCol.modelData.connected ? "Connected" : "Not Connected"
                    }
                }
            }
        }

        // Divider
        Rectangle {
            visible: root.wifiDevice !== null && root.wiredDevices.length > 0
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: Theme.accent
            opacity: 0.2
        }

        // Wired
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 4
            visible: root.wiredDevices.length > 0

            Text {
                text: "󰈀  Wired"
                color: Theme.accent
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.small
            }

            Repeater {
                model: root.wiredDevices

                Column {
                    id: wiredInterfacesCol
                    required property var modelData
                    spacing: 2

                    Text {
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.font.normal
                        color: Theme.foreground
                        text: wiredInterfacesCol.modelData.name
                    }

                    Text {
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.font.small
                        color: Theme.foreground
                        opacity: 0.6
                        text: wiredInterfacesCol.modelData.connected ? "Connected" : "Disconnected"
                    }
                }
            }
        }
    }
}
