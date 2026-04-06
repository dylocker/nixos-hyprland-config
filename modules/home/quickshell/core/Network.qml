pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root

  property bool wifiEnabled: true
  property string ssid: "Disconnected"
  property int strength: 0
  property bool connected: false

  // Polling timer to update status every 5 seconds
  Timer {
    interval: 5000; running: true; repeat: true; triggeredOnStart: true
    onTriggered: updateStatus.running = true
  }

  Process {
    id: updateStatus
    command: ["nmcli", "-g", "IN-USE,SIGNAL,SSID", "device", "wifi"]
    stdout: StdioCollector {
      onStreamFinished: {
        const lines = text.trim().split('\n');
        const active = lines.find(l => l.startsWith('*'));
        if (active) {
          const parts = active.split(':');
          root.connected = true;
          root.strength = parseInt(parts[1]);
          root.ssid = parts[2];
        } else {
          root.connected = false;
          root.ssid = "Disconnected";
        }
      }
    }
  }

  function toggleWifi() {
    const cmd = wifiEnabled ? "off" : "on";
    wifiEnabled = !wifiEnabled; // Optimistic update
    Process.run(["nmcli", "radio", "wifi", cmd]);
  }
}
