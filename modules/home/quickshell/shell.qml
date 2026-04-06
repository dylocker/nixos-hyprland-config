import Quickshell
import QtQuick
import "."
import "./components"

ShellRoot {
  NetworkPopup {
   id: netPopup
  }
  TopBar {
    networkPopupRef: netPopup
  }
}
