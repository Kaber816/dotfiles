import QtQuick
import qs.theme
import QtQuick.Layouts

Item {
    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight

    Rectangle {
        height: 35
        implicitWidth: row.implicitWidth + 30
        radius: height / 2
        color: "transparent" //Qt.darker(Theme.backgroundSecondary, 1.5)

        anchors {
            centerIn: parent
        }

        RowLayout {
            id: row
            spacing: 8
            anchors.centerIn: parent

            Text {
                text: Weather.icon + " " + Weather.temperature
                color: Theme.foreground
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.normal
            }

            Text {
                text: "|"
                color: Theme.foreground
                opacity: 0.6
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.normal
            }

            Text {
                text: Time.time
                color: Theme.foreground
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.normal
            }

            Text {
                text: "|"
                color: Theme.foreground
                opacity: 0.6
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.normal
            }

            Text {
                text: Time.date
                color: Theme.foreground
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.normal
            }

        }
    }
}
