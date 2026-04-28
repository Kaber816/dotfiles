import QtQuick
import qs.theme

Text {
    text: Time.time //  Directly accesses the time property from the Time singleton
    font.family: Theme.fontFamily
    font.pixelSize: 14
}
