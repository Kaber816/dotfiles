pragma Singleton
import Quickshell
import QtQuick
import Quickshell.Io

Singleton {
    id: root
    property string cpuUsage: "0.0"

    Process {
        id: cpuProcess
        command: ["sh", "-c", "LC_ALL=C top -bn2 -d 0.5 | grep 'Cpu(s)' | tail -1 | sed 's/.*, *\\([0-9.]*\\) id.*/\\1/'"]
        stdout: SplitParser {
            onRead: data => {
                const usage = 100 - parseFloat(data.trim())
                root.cpuUsage = usage < 10 ? usage.toFixed(1) : Math.round(usage).toString()
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
