import QtQuick 2.0
import Ubuntu.Components 1.1

Rectangle {
    id: notification

    anchors {
        horizontalCenter: parent.horizontalCenter
        bottom: parent.bottom
        bottomMargin: (mainView.useDeprecatedToolbar && toolbar.opened && !toolbar.locked ? toolbar.height : 0) + units.gu(2) + ((!mainView.anchorToKeyboard && Qt.inputMethod.visible) ? Qt.inputMethod.keyboardRectangle.height : 0)
        leftMargin: units.gu(2)
        rightMargin: units.gu(2)
    }

    readonly property real labelPadding: units.gu(4.5)

    height: label.height + units.gu(3)
    width: label.width + labelPadding
    radius: label.height / (2 * label.lineCount) + units.gu(1.5)
    color: Qt.rgba(0,0,0,0.7)

    opacity: showing ? 1 : 0

    Behavior on opacity {
        UbuntuNumberAnimation {}
    }

    property bool showing: false
    property alias text: label.text
    property MainView mainView
    property var queue: []
    property color textColor: "white"

    Component.onCompleted: mainView = findMainView() //This cannot be done as a property binding because the method will later return the QQuickRootItem.

    function show(text) {
        queue.push(text)
        if (!showing && !timer.running) { //!timer.running for the time between two notifications (when timer.interval === 800)
            update()
        }
    }

    function update() {
        notification.text = ""
        notification.text = queue.shift()
        notification.showing = true
    }

    onShowingChanged: {
        if (showing) {
            timer.restart()
        } else {
            if (queue.length > 0) {
                timer.interval = 800
                timer.restart()
            }
        }
    }

    Label {
        id: label
        anchors.centerIn: parent
        fontSize: "medium"
        color: textColor
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap

        property real wantedWidth: 0 //Needed for multi-line notifications

        onTextChanged: {
            if (text !== "") {
                wantedWidth = Math.min(contentWidth, mainView.width - notification.anchors.rightMargin - notification.anchors.leftMargin - notification.labelPadding)
            } else {
                wantedWidth = 0
            }
        }

        state: (wantedWidth === 0) ? "" : "wanted"
        states: [
            State {
                name: ""
            },
            State {
                name: "wanted"

                PropertyChanges {
                    target: label
                    width: wantedWidth
                }
            }
        ]
    }

    Timer {
        id: timer
        interval: 2000
        onTriggered: {
            if (interval === 2000) {
                showing = false
            } else {
                interval = 2000
                update()
            }
        }
    }

    function findMainView() {
        var up = parent
        while (up.parent !== null) {
            up = up.parent
        }
        return up
    }
}

