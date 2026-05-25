import Quickshell
import QtQuick
pragma Singleton 

Singleton {
    
    id: root

    readonly property string time: {
        //Qt.formatDateTime(clock.date, "h:mm AP - dddd, MM/dd/yy")
        Qt.formatDateTime(clock.date, "h:mm AP")
    }

    readonly property string date: {
        Qt.formatDateTime(clock.date, "MM/dd/yy")
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

}
