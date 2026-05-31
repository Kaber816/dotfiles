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

    property var activeDevice: {
        const devices = Networking.devices.values
        return devices.find(d => d.type === DeviceType.Wifi || d.type === DeviceType.Wired) ?? null
    }

    HoverHandler {
        id: networkHover
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
