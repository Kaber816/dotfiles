import QtQuick
import QtQuick.Layouts
import qs.theme

RowLayout {
    spacing: 6

    Text {
        text: ""
        color: Theme.foreground
        font.family: Theme.fontFamily
        font.pixelSize: Theme.font.normal
        Layout.alignment: Qt.AlignVCenter
    }

    Text {
        text: Cpu.cpuUsage + "%"
        color: Theme.foreground
        font.family: Theme.fontFamily
        font.pixelSize: Theme.font.normal
        Layout.alignment: Qt.AlignVCenter
    }
}
