import QtQuick 2.0
import Ubuntu.Components 1.1

MainView {
    id: mainView

    objectName: "mainView"

    automaticOrientation: true
    anchorToKeyboard: true

    width: units.gu(100)
    height: units.gu(75)

    useDeprecatedToolbar: false

    property var colors: {
        "green": "#5cb85c",
        "red": "#db3131",
        "yellow": "#f0ad4e",
        "blue": "#5bc0f9",
        "orange": UbuntuColors.orange,
        "default": Theme.palette.normal.baseText,
    }

    property bool wideAspect: width > units.gu(80)
    property bool extraWideAspect: width > units.gu(150)

    property Page initialPage
    property alias pages: pageStack.children

    PageStack {
        id: pageStack

        anchors.bottomMargin: wideAspect && mainView.toolbar.opened && mainView.toolbar.locked ? -mainView.toolbar.triggerSize : 0

        Component.onCompleted: {
            if (initialPage)
                pageStack.push(initialPage)
        }
    }

    Notification {
        id: notification
    }

    function toast(text, icon) {
        notification.show(text, icon)
    }

    function error(title, message, action) {
        PopupUtils.open(Qt.resolvedUrl("NotifyDialog.qml"), mainView,
                        {
                            title: title,
                            text: message,
                            action:action
                        })
    }
}
