import QtQuick
import QtQuick.Layouts
import qs.modules.bar.components
import qs.theme

Rectangle {
    id: root
    height: 35
    radius: 10
    color: Theme.backgroundSecondary
    implicitWidth: groupRow.implicitWidth + 20

    RowLayout {
        id: groupRow
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 2
        spacing: 12

        BatteryWidget {}
        RamUsageWidget {}
        CpuTempWidget {}
        CpuUsageWidget {}
        AudioWidget {}

        // Arch logo
        Text {
            text: ""
            color: Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.font.title
        }
    }
}
