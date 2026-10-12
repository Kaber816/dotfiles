import Quickshell 
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import qs.modules.bar
import qs.modules.bar.components
import qs.modules.bar.popouts
import qs.theme

PanelWindow {

    id: statusBarWindow 
    readonly property bool centerHovered: centerHover.hovered
    readonly property bool networkHovered: connectionsGroup.networkWidgetHovered 

    color: "transparent"
    implicitHeight: BarSettings.topBarHeight
    WlrLayershell.layer: WlrLayer.Top
    anchors { top: true; left: true; right: true }

    RowLayout {
        id: rowLayout 
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20

        // ============================================================
        //  LEFT SIDE 
        // ============================================================
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Workspaces {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                monitor: barScope.modelData
            }
        }

        // ============================================================
        //  CENTER 
        // ============================================================
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            HoverHandler {
                id: centerHover
            }

            ClockWidget {
                anchors.centerIn: parent
            }
        }

        // ============================================================
        //  RIGHT SIDE
        // ============================================================
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            
            RowLayout {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                spacing: 8

                ConnectionsGroup {
                    id: connectionsGroup
                }

                // Arch logo
                Text {
                    text: ""
                    color: Theme.foreground
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.font.title
                }
            }
        }
    }
}
