import QtQuick
import Quickshell
import Quickshell.Services.UPower

Item {
  id: root
  
  readonly property var battery: UPower.displayDevice
  
  readonly property real rawPercent: battery ? battery.percentage : 0
  readonly property real displayPercent: {
    // Convert 0.99 to 99
    let val = rawPercent <= 1 ? rawPercent * 100 : rawPercent;
  
    // If we are Charging (1) or Full (4) and above 99%, just show 100%
    if (val > 99 && (battery.state === 1 || battery.state === 4)) {
      return 100;
    }
  
    return val;
  }
  readonly property bool isPluggedIn: {
    if (!battery) return false;
  
    return battery.state === UPower.Charging || 
           battery.state === UPower.FullyCharged ||
           battery.state === 1 || 
           battery.state === 4;
  }  
  
  implicitWidth: batteryRow.width
  implicitHeight: batteryRow.height 

  Row {
    id: batteryRow
    spacing: 6 

    Item {
      width: 22
      height: 14
      anchors.verticalCenter: parent.verticalCenter

      Rectangle {
        id: body
        width: 20; height: 12; radius: 3
        color: "transparent"
        border.width: 1.5
        border.color: root.isPluggedIn ? Theme.colCyan : Theme.colBlue

        Rectangle {
          anchors.margins: 2
          anchors.left: parent.left
          anchors.top: parent.top
          anchors.bottom: parent.bottom
          
          // Use our cleaned displayPercent
          width: Math.max(0, (parent.width - 4) * (root.displayPercent / 100))
          radius: 1
          color: parent.border.color
          
          Behavior on width { NumberAnimation { duration: 500 } }
        }
      }

      Rectangle {
        anchors.left: body.right; anchors.leftMargin: -1
        anchors.verticalCenter: parent.verticalCenter
        width: 3; height: 5; radius: 1
        color: body.border.color
      }
    }

    Text {
      text: Math.ceil(root.displayPercent) + "%"
      color: root.isPluggedIn ? Theme.colCyan : Theme.colFg
      font {
        family: Theme.fontFamily
        pixelSize: Theme.fontSize - 2
        bold: root.isPluggedIn
      }
    }
  }
  
  // Debug log to your terminal to see exactly what's being sent
  Component.onCompleted: {
    if (battery) {
        console.log("Battery Percent Type:", typeof battery.percentage, "Value:", battery.percentage);
        console.log("Battery State:", battery.state);
    }
  }
}   
