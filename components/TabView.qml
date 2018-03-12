import QtQuick 2.0
import Ubuntu.Components 1.1

ListView {
    id: tabView

    orientation: Qt.Horizontal

    highlightMoveDuration: UbuntuAnimation.SlowDuration
    clip: true

    snapMode: ListView.SnapOneItem
    interactive: false
}
