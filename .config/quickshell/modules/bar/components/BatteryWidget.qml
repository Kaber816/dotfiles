import QtQuick
import QtQuick.Layouts
import qs.theme
import Quickshell.Io

Item {
    visible: Battery.present
    implicitWidth: Battery.present ? innerRow.implicitWidth : 0
    implicitHeight: Battery.present ? innerRow.implicitHeight : 0

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
                anchors.horizontalCenterOffset: -0.5
                text: {
                    if (Battery.charging) return "󱐋"
                    if (Battery.percentage <= 20) return ""
                    if (Battery.percentage <= 40) return ""
                    if (Battery.percentage <= 60) return ""
                    if (Battery.percentage <= 80) return ""
                    return ""
                }
                color: Theme.foreground
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.normal
            }
        }

        Text {
            text: Battery.percentage + "%"
            color: Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.font.normal
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
