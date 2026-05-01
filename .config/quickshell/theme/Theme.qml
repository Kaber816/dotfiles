pragma Singleton
import QtQuick

QtObject {
    property var font: QtObject {
        property int small: 12
        property int normal: 14
        property int large: 18
        property int title: 22
    }
    
    property QtObject pywal: Pywal {}
    property color background: Qt.rgba(0.07, 0.07, 0.07, 0.83)
    property color foreground: "#C7C2C2"
    property string fontFamily: "JetBrains Mono Nerd Font"

}
