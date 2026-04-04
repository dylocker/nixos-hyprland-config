import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }
  implicitHeight: 30 
  color: "#1a1b26"

  RowLayout {
    anchors.fill: parent
    anchors.margins: 8

    Clock { }

    Item { Layout.fillWidth: true }
    
    Battery { }
  }

  Workspaces {
    anchors.centerIn: parent
  }
   
}
