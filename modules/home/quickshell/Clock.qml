import Quickshell
import Quickshell.Io
import QtQuick

Text {
    id: clock
    color: Theme.colBlue
    text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
    font { family: Theme.fontFamily; pixelSize: Theme.fontSize; bold: true }
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
    }
}
