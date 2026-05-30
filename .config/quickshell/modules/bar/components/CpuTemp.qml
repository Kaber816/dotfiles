pragma Singleton
import Quickshell
import QtQuick
import Quickshell.Io

Singleton {
    id: root
    property real cpuTemp: 0

    Process {
        id: tempProcess
        command: ["sh", "-c", `
            # Try AMD k10temp (desktop often uses Tccd1 or temp1, laptop uses Tctl)
            temp=$(sensors 2>/dev/null | grep -A5 'k10temp' | grep -E 'Tctl|Tccd1|temp1' | head -1 | awk '{print $2}' | tr -d '+°C')
            # Try Intel coretemp
            if [ -z "$temp" ]; then
                temp=$(sensors 2>/dev/null | grep 'Package id 0' | awk '{print $4}' | tr -d '+°C')
            fi
            # Try generic CPU thermal zone
            if [ -z "$temp" ]; then
                temp=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
                temp=$(echo "$temp / 1000" | bc)
            fi
            # Try hwmon directly
            if [ -z "$temp" ]; then
                temp=$(cat /sys/class/hwmon/hwmon*/temp1_input 2>/dev/null | head -1)
                temp=$(echo "$temp / 1000" | bc)
            fi
            echo "$temp"
        `]
        stdout: SplitParser {
            onRead: data => {
                let val = parseFloat(data.trim())
                if (!isNaN(val) && val > 0) root.cpuTemp = Math.round(val)
            }
        }
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            tempProcess.running = false
            tempProcess.running = true
        }
    }

    Component.onCompleted: tempProcess.running = true
}
