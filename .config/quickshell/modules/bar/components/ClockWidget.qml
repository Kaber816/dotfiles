import QtQuick
import qs.theme

Text {
    text: Time.time //  Directly accesses the time property from the Time singleton
    color: Theme.foreground
    font.family: Theme.fontFamily
    font.pixelSize: Theme.font.normal
}
