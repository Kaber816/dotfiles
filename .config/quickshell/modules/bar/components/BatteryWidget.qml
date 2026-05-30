import QtQuick
import QtQuick.Layouts
import qs.theme
import Quickshell.Io

RowLayout {
    spacing: 6

    Rectangle {
        width: 25
        height: 25
        radius: width / 2
        color: Theme.accent

        Text {
            anchors.centerIn: parent
            text: {
                if (Battery.charging) return "󱐋"
                if (Battery.percentage <= 20) return ""
                if (Battery.percentage <= 40) return ""
                if (Battery.percentage <= 60) return ""
                if (Battery.percentage <= 80) return ""
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
