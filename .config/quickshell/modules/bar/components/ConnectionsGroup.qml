import QtQuick
import QtQuick.Layouts
import qs.modules.bar.components
import qs.theme

Rectangle {
    id: root
    height: 35
    radius: height / 2
    color: Theme.backgroundSecondary
    implicitWidth: groupRow.implicitWidth + 30
        
    property bool networkWidgetHovered : networkWidget.hovered

    RowLayout {
        id: groupRow
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 0
        spacing: 10

        BatteryWidget {}
        RamUsageWidget {}
        CpuTempWidget {}
        CpuUsageWidget {}
        AudioWidget {}
        NetworkWidget {
            id: networkWidget
        }
    }
}
