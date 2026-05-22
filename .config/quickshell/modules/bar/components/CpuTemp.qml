pragma Singleton
import Quickshell
import QtQuick
import Quickshell.Io

Singleton {
    id: root
    property real cpuTemp: 0

    Process {
        id: tempProcess
        command: ["sh", "-c", "sensors k10temp-pci-00c3 | grep 'Tctl' | awk '{print $2}' | tr -d '+°C'"]
        stdout: SplitParser {
            onRead: data => {
                root.cpuTemp = Math.round(parseFloat(data.trim()))
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
