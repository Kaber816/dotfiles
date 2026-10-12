import Quickshell 
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import qs.modules.bar
import qs.modules.bar.popouts
import qs.theme

PanelWindow {
    id: popoutWindow

    property bool centerHovered: false
    property bool networkHovered: false

    color: "transparent"
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.exclusionMode: ExclusionMode.Ignore
    implicitHeight: BarSettings.topBarHeight + 600
    anchors { top: true; left: true; right: true }

    mask: Region {
        x: topCenterPopout.x
        y: topCenterPopout.y
        width: topCenterPopout.expanded ? topCenterPopout.width: 0
        height: topCenterPopout.expanded ? topCenterPopout.height : 0

        Region {
            x: networkPopout.x
            y: networkPopout.y
            width: networkPopout.expanded ? networkPopout.width : 0
            height: networkPopout.expanded ? networkPopout.height : 0
        }
    }

    // ============================================================
    //  TOP CENTER POPOUT
    // ============================================================
    TopCenterPopout {
        id: topCenterPopout
        anchors {
            top: parent.top
            topMargin: BarSettings.topBarHeight - (Theme.strokeWidth / 2)
            horizontalCenter: parent.horizontalCenter
        }
        expanded: centerHovered || topCenterPopout.hovered
    }

    // ============================================================
    //  NETWORK POPOUT
    // ============================================================
    NetworkPopout {
        id: networkPopout
        expanded: popoutWindow.networkHovered
        anchors {
            top: parent.top
            topMargin: BarSettings.topBarHeight - (Theme.strokeWidth / 2)
            right: parent.right
            rightMargin: 65
        }
    }
}
