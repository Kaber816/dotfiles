import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.modules.bar.components
import qs.theme

Scope {

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            color: "transparent"

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 50

            Rectangle {
                anchors.fill: parent
                anchors.margins: 6
                radius: 10
                color: Theme.background

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 9
                    spacing: 10


                    ClockWidget {
                        color: Theme.foreground
                        Layout.fillHeight: false
                        Layout.alignment: Qt.AlignRight
                    }
                }
            }
        }
    }
}
