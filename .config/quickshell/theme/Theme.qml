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

    // --------------------
    // LIGHT/DARK DETECTION
    // --------------------


    property color lightThreshold: "#1d0c0b" // This is tuned from some of my light backgrounds
    property color color0: Theme.wal.colors.color0 ?? "#000000" // Easiest to check for light/dark
    property bool isLight: color0 > lightThreshold

    property color background: isLight
        ? Qt.darker(Theme.wal.colors.color6, 0.53) ?? "#ffffff"
        : Qt.darker(Theme.wal.colors.color8, 4.0) ?? "#111111" 

    property color backgroundSecondary: isLight
        ? Qt.darker(Theme.wal.colors.color6, 0.60)
        : Qt.darker(Theme.wal.colors.color8, 2.0)

    property color foreground: isLight
    ? "#303030"
    : "#C0C0C0"

    property color accent: Qt.darker(Theme.wal.colors.color4, 1.1)
    


}
