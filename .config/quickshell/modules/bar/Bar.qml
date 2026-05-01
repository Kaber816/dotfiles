import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.modules.bar.components
import qs.theme

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            color: "transparent" // This is so we can use rounded rectangle edges

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 40

            Rectangle { // Allows for rounded bar by using transparent panelWindow (still need panelWindow to reserve space)
                anchors.fill: parent // Fill the panelWindow
                radius: 10
                color: Theme.background

                RowLayout {
                    anchors.fill: parent // Make the layout take up the whole top bar
                    anchors.rightMargin: 10

                    ClockWidget {
                        Layout.fillHeight: false
                        Layout.alignment: Qt.AlignRight
                    }
                }
            }
        }
    }
}
