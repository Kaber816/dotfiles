import QtQuick
import QtQuick.Layouts
import qs.modules.bar.components
import qs.theme

Rectangle {
    id: root
    height: 35
    radius: height / 2
    color: Theme.backgroundSecondary
    implicitWidth: groupRow.implicitWidth + 10

    RowLayout {
        id: groupRow
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 0
        spacing: 8

        BatteryWidget {}
        //RamUsageWidget {}
        //CpuTempWidget {}
        //CpuUsageWidget {}
        //AudioWidget {}
        WifiWidget {}

    }
}
