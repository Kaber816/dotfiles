pragma Singleton
import QtQuick
import Quickshell.Io

QtObject {
    property var font: QtObject {
        property int small: 12
        property int normal: 14
        property int large: 18
        property int title: 22
    }
    
    property color background: Qt.rgba(0.07, 0.07, 0.07, 0.83)
    property color foreground: "#C7C2C2"
    property string fontFamily: "JetBrains Mono Nerd Font"


    // ------------------
    // PYWAL COLOR LOADER
    // ------------------

    property var pywal: FileView {
        id: pywal
        path: "/home/kadenb/.cache/wal/colors.json"

        watchChanges: true
        onFileChanged: reload()

        adapter: JsonAdapter {

            property JsonObject special: JsonObject {
                property string background: "#000000"
                property string foreground: "#ffffff"
                property string cursor: "#ffffff"
            }

            property JsonObject colors: JsonObject {
                property string color0: "#000000"
                property string color1: "#000000"
                property string color2: "#000000"
                property string color3: "#000000"
                property string color4: "#000000"
                property string color5: "#000000"
                property string color6: "#000000"
                property string color7: "#000000"
                property string color8: "#000000"
                property string color9: "#000000"
                property string color10: "#000000"
                property string color11: "#000000"
                property string color12: "#000000"
                property string color13: "#000000"
                property string color14: "#000000"
                property string color15: "#000000"
            }
        }
    }
    property var wal: pywal.adapter
}
