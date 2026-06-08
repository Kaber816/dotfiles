import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.theme

Rectangle {
    id: root
    width: 300
    height: width
    color: Theme.accent
    radius: 20

    property int days: 31
    
    GridLayout {
        anchors {
            fill: parent
        }
        columns: 7

        Repeater {
            model: root.days

            Rectangle {
                width: 20
                height: width
                color: Theme.foreground
                radius: 2
            }
        }
    }
}
