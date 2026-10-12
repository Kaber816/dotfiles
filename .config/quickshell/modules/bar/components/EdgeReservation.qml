import Quickshell
import Quickshell.Wayland
import qs.modules.bar

PanelWindow {
    required property string edge   // "left" | "right" | "bottom"

    readonly property bool isVertical: edge === "left" || edge === "right"

    color: "transparent"
    WlrLayershell.layer: WlrLayer.Top

    implicitWidth: BarSettings.screenBorderWidth
    implicitHeight: BarSettings.screenBorderWidth

    anchors {
        top: isVertical
        bottom: true
        left: edge === "left" || edge === "bottom"
        right: edge === "right" || edge === "bottom"
    }
}
