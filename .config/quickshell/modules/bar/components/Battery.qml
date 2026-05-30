pragma Singleton
import Quickshell
import QtQuick
import Quickshell.Io

Singleton {
    id: root
    property int percentage: 0
    property bool charging: false

    Process {
        id: batteryProcess
        command: ["sh", "-c", `
            percent=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
            if [ -z "$percent" ]; then
                percent=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null)
            fi
            status=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null)
            if [ -z "$status" ]; then
                status=$(cat /sys/class/power_supply/BAT1/status 2>/dev/null)
            fi
            echo "$percent $status"
        `]
        stdout: SplitParser {
            onRead: data => {
                let parts = data.trim().split(" ")
                let val = parseInt(parts[0])
                if (!isNaN(val)) root.percentage = val
                root.charging = parts[1] === "Charging"
            }
        }
    }

    Timer {
        interval: 30000
        running: true
        repeat: true
        onTriggered: {
            batteryProcess.running = false
            batteryProcess.running = true
        }
    }

    Component.onCompleted: batteryProcess.running = true
}
