import Quickshell
import Quickshell.Networking
import QtQuick
import QtQuick.Layouts
import qs.theme
import QtQuick.Shapes

Item {
    id: root
    implicitWidth: innerRow.implicitWidth
    implicitHeight: innerRow.implicitHeight
    property bool hovered: networkHover.hovered

    property var wifiDevice: {
        const devices = Networking.devices.values
        return devices.find(d => d.type === DeviceType.Wifi) ?? null
    }

    property var wiredDevice: {
        const devices = Networking.devices.values
        return devices.filter(d => d.type === DeviceType.Wired) ?? null
    }

    property var activeDevice: {
        const connectedWired = wiredDevice.find(d => d.connected)
        if (connectedWired) return connectedWired
        if (wifiDevice?.connected) return wifiDevice
        return null
    }

    HoverHandler {
        id: networkHover

        // Not using this but useful for understanding how quickshell types work
       // onHoveredChanged: {
       //     const devices = Networking.devices.values
       //     for (const device of devices) {
       //         console.log("device:", device.name, "type:", DeviceType.toString(device.type), "Connected:", ConnectionState.toString(device.state))
       //         for (const network of device.networks.values) {
       //             console.log("  network:", network.name)
       //         }
       //     }
       // }
    }

    RowLayout {
        id: innerRow
        spacing: 6

        Rectangle {
            Layout.preferredWidth: 25
            Layout.preferredHeight: 25
            radius: width / 2
            color: Theme.accent

            Text {
                anchors.centerIn: parent
                color: Theme.foreground
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.large

                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -1.0

                text: {
                    if (!root.activeDevice) return "󰖪"
                    if (root.activeDevice.type === DeviceType.Wired) return "󰈀"
                    if (root.activeDevice.type === DeviceType.Wifi) return "󰖩"
                    return "󰖪"
                }
            }
        }
    }
}
