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
        Scope { // Gives each screen its own bar instance
            id: barScope
            required property ShellScreen modelData // Each model screen that we iterate over

            BackgroundWindow { screen: barScope.modelData } // Border that goes around the entire screen

            // Visual popouts on screen
            PopoutsWindow { 
                screen: barScope.modelData; 
                centerHovered: bar.centerHovered 
                networkHovered: bar.networkHovered
            }

            // Top bar reservation and contents
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
