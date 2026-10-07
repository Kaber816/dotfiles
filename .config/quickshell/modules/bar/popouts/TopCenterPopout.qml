import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.theme
import qs.modules.bar.components

TopPopoutContainer {
    id: root
    popoutWidth: 600
    expandedHeight: 400
    
    GridLayout{
        anchors.centerIn: parent
        rowSpacing: 10
        columnSpacing: 35

        CalendarWidget {
            id: calendar
        }

        WeatherWidget {
            id: weather
        }
    }
}
