// CalendarWidget.qml
import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.theme

Item {
    id: root
    width: 250
    height: 250

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
    readonly property var dayNames: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    Rectangle {
        //color: Theme.background
        //border.color: Theme.accent
        color: Qt.alpha(Theme.accent, 0.2)
        border.color: "transparent"
        border.width: Theme.strokeWidth
        anchors.fill: parent
        radius: Theme.globalRadius
    
        ColumnLayout {
            id: calendarColumn
            spacing: 5
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                margins: 10
            }

            // Header
            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: ""
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
                    text: ""
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

                Repeater {
                    model: 42

                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 28

                        // Date overflow rolls into adjacent months automatically
                        readonly property var cellDate: new Date(
                            root.displayYear,
                            root.displayMonth,
                            index - root.firstDayOfWeek + 1
                        )
                        readonly property bool inMonth: cellDate.getMonth() === root.displayMonth
                        readonly property bool isToday: {
                            const t = new Date()
                            return cellDate.getDate() === t.getDate() &&
                                   cellDate.getMonth() === t.getMonth() &&
                                   cellDate.getFullYear() === t.getFullYear()
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
                            text: parent.cellDate.getDate()
                            color: parent.isToday ? Theme.background : Theme.foreground
                            opacity: parent.inMonth ? 1.0 : 0.3
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
}
