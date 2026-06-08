import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.theme
import qs.modules.bar.components

TopPopoutContainer {
    id: root
    popoutWidth: 600
    expandedHeight: 400
    
    GridLayout {
        CalendarWidget {}
    }
}
