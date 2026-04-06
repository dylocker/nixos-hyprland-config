import QtQuick
import QtQuick.Layouts
import ".." // To see Theme and Network singletons

Item {
  id: root
  implicitWidth: row.implicitWidth
  implicitHeight: 24
  
  // This property will be linked in shell.qml
  property var popupRef

  Row {
    id: row
    spacing: 3
    anchors.centerIn: parent

    Text {
      text: !Network.connected ? "󰖪" : (Network.strength > 70 ? "󰤨" : "󰤥")
      font { family: Theme.fontFamily; pixelSize: 14 }
      color: Network.connected ? Theme.colCyan : Theme.colMuted
    }

    Text {
      text: Network.ssid
      font { family: Theme.fontFamily; pixelSize: 11 }
      color: Theme.colFg
      visible: Network.connected
    }
  }

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onClicked: popupRef.visible = !popupRef.visible
  }
}
