import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.modules.bar.components

Scope {

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            color: Qt.rgba(0.07, 0.07, 0.07, 0.83)

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            RowLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 10
                
                Item { Layout.fillWidth: true  }

                ClockWidget { 
                    color: "#C7C2C2" 
                }
            }
        }
    }
}
