pragma Singleton
import Quickshell
import QtQuick
import Quickshell.Io

Singleton {
    id: root
    property real cpuUsage: 0

    Process {
        id: cpuProcess
        command: ["sh", "-c", "top -bn1 | grep 'Cpu(s)' | awk '{print $2}'"]
        stdout: SplitParser {
            onRead: data => {
                root.cpuUsage = Math.round(parseFloat(data.trim()))
            }
        }
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            cpuProcess.running = false
            cpuProcess.running = true
        }
    }

    Component.onCompleted: cpuProcess.running = true
}
