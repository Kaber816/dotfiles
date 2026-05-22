import QtQuick
import QtQuick.Layouts
import qs.theme

RowLayout {
    spacing: 6

    Text {
        text: {
            if (CpuTemp.cpuTemp < 50) return ""
            if (CpuTemp.cpuTemp < 75) return ""
            return ""
        }
        color: Theme.foreground
        font.family: Theme.fontFamily
        font.pixelSize: Theme.font.normal
        Layout.alignment: Qt.AlignVCenter
    }

    Text {
        text: CpuTemp.cpuTemp + "°C"
        color: Theme.foreground
        font.family: Theme.fontFamily
        font.pixelSize: Theme.font.normal
        Layout.alignment: Qt.AlignVCenter
    }
}
