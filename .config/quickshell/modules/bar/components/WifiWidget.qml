import Quickshell
import Quickshell.Networking
import QtQuick
import QtQuick.Layouts
import qs.theme

Item {
    implicitWidth: innerRow.implicitWidth
    implicitHeight: innerRow.implicitHeight

    property var activeDevice: {
        const devices = Networking.devices.values
        return devices.find(d => d.type === DeviceType.Wifi || d.type === DeviceType.Wired) ?? null
    }

    RowLayout {
        id: innerRow
        spacing: 6

        Rectangle {
            width: 25
            height: 25
            radius: width / 2
            color: Theme.accent

            Text {
                anchors.centerIn: parent
                color: Theme.foreground
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.large

                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -0.9

                text: {
                    if (!activeDevice) return "󰖪"
                    if (activeDevice.type === DeviceType.Wired) return "󰈁"
                    if (activeDevice.type === DeviceType.Wifi) return "󰖩"
                    return "󰖪"
                }
            }
        }
    }
}
