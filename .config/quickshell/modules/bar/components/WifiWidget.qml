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

    property var activeDevice: {
        const devices = Networking.devices.values
        return devices.find(d => d.type === DeviceType.Wifi || d.type === DeviceType.Wired) ?? null
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
                    if (!activeDevice) return "󰖪"
                    if (activeDevice.type === DeviceType.Wired) return "󰈀"
                    if (activeDevice.type === DeviceType.Wifi) return "󰖩"
                    return "󰖪"
                }
            }
        }
    }
}
