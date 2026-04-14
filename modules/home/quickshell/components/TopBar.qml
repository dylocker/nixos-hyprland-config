import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "../core"


PanelWindow {
  property var networkPopupRef
  anchors {
    top: true
    left: true
    right: true
  }
  implicitHeight: 25 
  color: "#1a1b26"

  RowLayout {
    anchors.fill: parent

    Clock { }

    Item { Layout.fillWidth: true }
    
    NetworkWidget { }
    Battery { }
  }

  Workspaces {
    anchors.centerIn: parent
  }
   
}
