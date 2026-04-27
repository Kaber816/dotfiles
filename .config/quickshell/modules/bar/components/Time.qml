import Quickshell
import QtQuick

pragma Singleton 
Singleton {
    
    id: root

    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm AP - ddd, mm/dd/yy")
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

}
