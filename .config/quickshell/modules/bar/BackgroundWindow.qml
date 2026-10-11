import Quickshell 
import QtQuick
import Quickshell.Wayland
import qs.modules.bar.components

PanelWindow {
    screen: barScope.modelData
    color: "transparent"
    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.exclusionMode: ExclusionMode.Ignore

    mask: Region{} // lets clicks pass straight through

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

    Background {} // All background drawings/elements done here
}
