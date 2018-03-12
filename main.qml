import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    flags: Qt.FramelessWindowHint
    color: "transparent"

    minimumHeight: 200
    minimumWidth: 200

    Column {
        anchors.topMargin: parent.topMargin
        anchors.verticalCenter: parent.verticalCenter

        //top panel
        Rectangle {
            id: topPanel
            height: 50
            width:mainWindow.width
            color: "red"

            Row {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                Image {
                    id: appIcon
                    width:50
                    height:50
                    source: "qrc:/resources/appIcon.png"
                }
            }

        }

        Rectangle {
            id: contentPanel
            height: mainWindow.height - topPanel.height
            width: mainWindow.width
            color: "transparent"

            Row {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                LeftSideMenu{
                    id: leftSideMenu
                    height: contentPanel.height
                    width: 200
                }

                Rectangle {
                    id: rightSideContent
                    height: contentPanel.height
                    width: contentPanel.width - leftSideMenu.width
                    color: "yellow"
                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent;
        propagateComposedEvents: true
//        hoverEnabled: true

        property variant clickPos: "1,1"

        property variant status //none, resize and drag

        onPressed: {
            clickPos = Qt.point(mouse.x, mouse.y)

            if (topPanel.contains(clickPos)) {
                status = "drag"
            } else if ((clickPos.x + 10) > mainWindow.width
                       &&(clickPos.y + 10) > mainWindow.height) {
                status = "resize"
            } else {
                mouse.accepted = false
            }
        }

        onReleased: {
            status = "none"
            mouse.accepted = false
        }

        onPositionChanged: {
            //temoparyr not used
//            if ((mouse.x + 10) > mainWindow.width
//                    &&(mouse.y + 10) > mainWindow.height) {
//                cursorShape = Qt.SizeFDiagCursor
//            } else {
//                cursorShape = Qt.ArrowCursor
//            }

            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
            if (status === "drag") {
                var new_x = mainWindow.x + delta.x
                var new_y = mainWindow.y + delta.y
                if (new_y <= 0) {
                    mainWindow.visibility = Window.Maximized
                } else if (mainWindow.visibility === Window.Maximized)
                    mainWindow.visibility = Window.Windowed
                mainWindow.x = new_x
                mainWindow.y = new_y
            } else if (status === "resize") {
                mainWindow.width += delta.x;
                mainWindow.height += delta.y;
                clickPos.x += delta.x;
                clickPos.y += delta.y;
            } else {
                mouse.accepted = false
            }
        }
    }
}
