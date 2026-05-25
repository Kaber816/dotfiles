pragma Singleton
import Quickshell
import QtQuick
import Quickshell.Io

Singleton {
    id: root
    property string temperature: ""
    property string condition: ""
    property string icon: ""

    Process {
        id: weatherProcess
        // returns just temp and condition code in a simple format
        command: ["sh", "-c", "curl -s 'wttr.in/?format=%t+%C'"]
        stdout: SplitParser {
            onRead: data => {
                let parts = data.trim().split(" ")
                root.temperature = parts[0].replace("+", "")
                root.condition = parts.slice(1).join(" ")
                root.icon = getIcon(root.condition.toLowerCase())
            }
        }
    }

    function getIcon(condition) {
        if (condition.includes("sun") || condition.includes("clear")) return "󰖙"
        if (condition.includes("cloud")) return "󰖐"
        if (condition.includes("rain") || condition.includes("drizzle")) return "󰖗"
        if (condition.includes("snow")) return "󰖘"
        if (condition.includes("thunder") || condition.includes("storm")) return "󰖓"
        if (condition.includes("fog") || condition.includes("mist")) return "󰖑"
        return "󰖙"
    }

    Timer {
        interval: 600000 // refresh every 10 minutes
        running: true
        repeat: true
        onTriggered: {
            weatherProcess.running = false
            weatherProcess.running = true
        }
    }

    Component.onCompleted: weatherProcess.running = true
}
