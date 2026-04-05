import Quickshell
import QtQuick

Item {
  id: root
  implicitWidth: clockRow.implicitWidth
  implicitHeight: clockRow.implicitHeight

  Row {
    id: clockRow
    anchors.centerIn: parent
    spacing: 8

    Row {
      anchors.verticalCenter: parent.verticalCenter
      spacing: 1

      Text {
        id: hoursText
        text: Time.format("HH")
        color: Theme.colFg
        font {
          pixelSize: Theme.fontSize
          weight: Font.Bold
          family: Theme.fontFamily
        }
      }

      Text {
        id: colonSeparator
        text: ":"
        color: Theme.colBlue
        font {
          pixelSize: Theme.fontSize
          weight: Font.Bold
          family: Theme.fontFamily
        }
      }

      Text {
        id: minutesText
        text: Time.format("mm")
        color: Theme.colFg
        font {
          pixelSize: Theme.fontSize
          weight: Font.Bold
          family: Theme.fontFamily
        }
      }
    }

    Text {
      id: dateText 
      text: Time.format("ddd d")
      color: Theme.colFg
      anchors.verticalCenter: parent.verticalCenter
      font {
        pixelSize: Theme.fontSize
        weight: Font.Medium
        family: Theme.fontFamily
      }
    }
  } 
}
