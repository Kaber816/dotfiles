pragma Singleton
import Quickshell
import QtQuick
import Quickshell.Io

Singleton {
    id: root
    property int volumeLevel: 0
    property bool isMuted: false

    Process {
        id: volumeProcess
        command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]
        stdout: SplitParser {
            onRead: data => {
                let parts = data.trim().split(" ")
                root.volumeLevel = Math.round(parseFloat(parts[1]) * 100)
                root.isMuted = data.includes("MUTED")
            }
        }
    }

    Process {
        id: volumeWatcher
        command: ["pactl", "subscribe"]
        running: true
        stdout: SplitParser {
            onRead: data => {
                if (data.includes("sink") || data.includes("server")) {
                    volumeProcess.running = false
                    volumeProcess.running = true
                }
            }
        }
    }

    Component.onCompleted: volumeProcess.running = true
}
