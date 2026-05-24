pragma Singleton
import Quickshell
import QtQuick
import Quickshell.Io

Singleton {
    id: root
    property real ramUsage: 0.0

    Process {
        id: ramProcess
        command: ["sh", "-c", "free -m | awk '/^Mem:/ {printf \"%.1f\", $3/1024}'"]
        stdout: SplitParser {
            onRead: data => {
                root.ramUsage = parseFloat(data.trim())
            }
        }
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            ramProcess.running = false
            ramProcess.running = true
        }
    }

    Component.onCompleted: ramProcess.running = true
}

