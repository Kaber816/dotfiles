import Quickshell 
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import qs.modules.bar
import qs.modules.bar.components
import qs.modules.bar.popouts
import qs.theme

Scope {
    id: root
    Variants {
        model: Quickshell.screens 
        Scope {
            id: barScope
            required property ShellScreen modelData

            BackgroundWindow { screen: barScope.modelData }

            PopoutsWindow { 
                screen: barScope.modelData; 
                centerHovered: bar.centerHovered 
                networkHovered: bar.networkHovered
            }

            StatusBarWindow { 
                id: bar;
                screen: barScope.modelData
            } 

            EdgeReservation { screen: barScope.modelData; edge: "left" }
            EdgeReservation { screen: barScope.modelData; edge: "right" }
            EdgeReservation { screen: barScope.modelData; edge: "bottom" }
        }
    }
}
