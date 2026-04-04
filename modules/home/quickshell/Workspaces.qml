import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Row {
    id: root
    spacing: 5 // Adjust spacing between numbers here

    Repeater {
        model: 9

        Text {
            // Logic for finding if the workspace exists
            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
            // Logic for checking if it's the current one
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
            
            text: index + 1
            font { family: Theme.fontFamily; pixelSize: Theme.fontSize; bold: true }
            
            // Tokyo Night colors
            color: isActive ? Theme.colCyan : (ws ? Theme.colBlue : Theme.colMuted)

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: Hyprland.dispatch("workspace " + (index + 1))
            }
        }
    }
}
