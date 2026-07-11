// CalendarWidget.qml
import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.theme

Item {
    id: root
    width: parent.width
    height: calendarColumn.implicitHeight

    property var now: new Date()
    property int displayYear: now.getFullYear()
    property int displayMonth: now.getMonth()

    property int daysInMonth: new Date(displayYear, displayMonth + 1, 0).getDate()
    property int firstDayOfWeek: new Date(displayYear, displayMonth, 1).getDay()

    readonly property var monthNames: [
        "January", "February", "March", "April",
        "May", "June", "July", "August",
        "September", "October", "November", "December"
    ]
    readonly property var dayNames: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]

    ColumnLayout {
        id: calendarColumn
        width: parent.width
        spacing: 8

        // Header
        RowLayout {
            Layout.fillWidth: true

            Text {
                text: "󰔃"
                color: Theme.foreground
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.normal
                opacity: 0.6

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if (root.displayMonth === 0) {
                            root.displayMonth = 11
                            root.displayYear--
                        } else {
                            root.displayMonth--
                        }
                    }
                }
            }

            Item { Layout.fillWidth: true }

            Text {
                text: root.monthNames[root.displayMonth] + "  " + root.displayYear
                color: Theme.foreground
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.normal
                font.weight: Font.Medium
                horizontalAlignment: Text.AlignHCenter
            }

            Item { Layout.fillWidth: true }

            Text {
                text: "󰔄"
                color: Theme.foreground
                font.family: Theme.fontFamily
                font.pixelSize: Theme.font.normal
                opacity: 0.6

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if (root.displayMonth === 11) {
                            root.displayMonth = 0
                            root.displayYear++
                        } else {
                            root.displayMonth++
                        }
                    }
                }
            }
        }

        // Day name headers
        GridLayout {
            Layout.fillWidth: true
            columns: 7
            columnSpacing: 0
            rowSpacing: 0

            Repeater {
                model: root.dayNames
                Text {
                    Layout.fillWidth: true
                    text: modelData
                    color: Theme.foreground
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.font.small
                    opacity: 0.4
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }

        // Day grid
        GridLayout {
            id: dayGrid
            Layout.fillWidth: true
            columns: 7
            columnSpacing: 4
            rowSpacing: 4

            // Empty cells before first day
            Repeater {
                model: root.firstDayOfWeek
                Item {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 28
                }
            }

            // Day cells
            Repeater {
                model: root.daysInMonth
                Item {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 28

                    property bool isToday: {
                        const t = new Date()
                        return modelData + 1 === t.getDate() &&
                               root.displayMonth === t.getMonth() &&
                               root.displayYear === t.getFullYear()
                    }

                    Rectangle {
                        anchors.centerIn: parent
                        width: 26
                        height: 26
                        radius: width / 2
                        color: parent.isToday ? Theme.accent : "transparent"
                    }

                    Text {
                        anchors.centerIn: parent
                        text: modelData + 1
                        color: parent.isToday ? Theme.background : Theme.foreground
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.font.small
                        font.weight: parent.isToday ? Font.Bold : Font.Normal
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }
    }
}
