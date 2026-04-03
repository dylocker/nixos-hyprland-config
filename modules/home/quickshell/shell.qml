import Quickshell
import QtQuick

ShellRoot {
    PanelWindow {
        anchors {
            top: true
            left: true
            right: true
        }
        height: 50
        color: "#2e3440" // A nice Nordic dark blue

        Text {
            anchors.centerIn: parent
            text: "Quickshell is Active"
            color: "white"
        }
    }
}
