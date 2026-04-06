import Quickshell
import QtQuick
import ".."

PanelWindow {
  id: win
  property bool shouldShow: false
  visible: shouldShow
  
  // Position it at the top right, with a margin for the bar
  anchors: Anchor.Top | Anchor.Right
  margins.top: 40 
  margins.right: 10

  // The actual visual box
  Rectangle {
    width: 500
    height: 120
    color: Theme.colBg
    border.color: Theme.colBlue
    border.width: 1
    radius: 8

    Column {
      anchors.fill: parent
      anchors.margins: 10
      spacing: 10

      Text {
        text: "Networking"
        color: Theme.colCyan
        font { bold: true; pixelSize: 14 }
      }

      Rectangle { width: parent.width; height: 1; color: Theme.colMuted }

      Text {
        text: Network.wifiEnabled ? "󰖩 Wi-Fi Enabled" : "󰖪 Wi-Fi Disabled"
        color: Theme.colFg
      }

      // A simple toggle button
      Rectangle {
        width: parent.width
        height: 30
        color: Theme.colBlue
        radius: 4
        Text {
          anchors.centerIn: parent
          text: Network.wifiEnabled ? "Turn Off" : "Turn On"
          color: Theme.colBg
        }
        MouseArea {
          anchors.fill: parent
          onClicked: Network.toggleWifi()
        }
      }
    }
  }
}
