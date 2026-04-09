import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import ".."

Row {
    id: root
    spacing: 5 // Adjust spacing between numbers here

    property var activeWorkspaces: []
    property int currentWorkspace: 1

    // 1. Process to fetch the exact current state of workspaces
    Process {
        id: fetchWorkspaces
        command: ["niri", "msg", "-j", "workspaces"]
        running: true // Run once on startup
        
        // Use StdioCollector to gather all the JSON output, then parse it when the command exits
        stdout: StdioCollector {
            onStreamFinished: {
                try {
                    let data = JSON.parse(this.text);
                    let activeIds = [];
                    
                    for (let i = 0; i < data.length; i++) {
                        activeIds.push(data[i].idx); 
                        if (data[i].is_focused) {
                            root.currentWorkspace = data[i].idx;
                        }
                    }
                    root.activeWorkspaces = activeIds;
                } catch (e) {
                    console.error("Failed to parse Niri workspaces payload:", e);
                }
            }
        }
    }

    // 2. Process to listen to Niri's live event stream
    Process {
        id: niriListener
        command: ["niri", "msg", "event-stream"]
        running: true
        
        // Use SplitParser to trigger an action every time a new line is printed to the stream
        stdout: SplitParser {
            onRead: {
                fetchWorkspaces.running = true;
            }
        }
    }

    Repeater {
        model: 9

        Text {
            property int wsIndex: index + 1
            
            // Logic for finding if the workspace exists in our Niri state array
            property bool exists: root.activeWorkspaces.includes(wsIndex)
            // Logic for checking if it's the current one
            property bool isActive: root.currentWorkspace === wsIndex
            
            text: wsIndex
            font { family: Theme.fontFamily; pixelSize: Theme.fontSize; bold: true }
            
            // Tokyo Night colors
            color: isActive ? Theme.colCyan : (exists ? Theme.colBlue : Theme.colMuted)

            // Process to handle the click action via Niri IPC
            Process {
                id: focusAction
                command: ["niri", "msg", "action", "focus-workspace", wsIndex.toString()]
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: focusAction.running = true
            }
        }
    }
}
