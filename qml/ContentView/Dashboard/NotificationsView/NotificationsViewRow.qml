import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.1

Rectangle {
    id: notificationsViewRow
    property int cellWidth: 210
    property int cellHeight: 40
    property alias detailedVisible: detailedButton.visible
    color: "blue"

    height: cellHeight

    signal pressed()

    property alias test:test.color

    Row {
        spacing: 0

        Rectangle {
            id: test
            width:cellWidth
            height: cellHeight
            color: "transparent"

            Rectangle {
                x: 10
                anchors.verticalCenter: test.verticalCenter
                width: 20
                height: 20
                radius: 20
                color: "red"
            }
        }

        Rectangle {
            id: imageBackground
            width:cellWidth
            height: cellHeight
            color: "transparent"

            Image {
                anchors.verticalCenter: imageBackground.verticalCenter
                width: 30
                height: 20
                source: "qrc:/resources/flags/ua.png"
            }
        }

        Text {
            verticalAlignment: Text.AlignVCenter
            width:cellWidth
            height: cellHeight
            text: "Lviv Region"
        }

        Text {
            verticalAlignment: Text.AlignVCenter
            width:cellWidth
            height: cellHeight
            text: "Ukraine"
        }

        Text {
            verticalAlignment: Text.AlignVCenter
            width:cellWidth
            height: cellHeight
            text: "King Cross"
        }

        Text {
            verticalAlignment: Text.AlignVCenter
            width:cellWidth
            height: cellHeight
            text: "07.17.2017"
        }

        Button {
            id: detailedButton
            width: cellWidth
            height: cellHeight
            visible: true

            Text {
                anchors.fill: detailedButton
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: qsTr("Show Details")
            }

            onPressed: {
                notificationsViewRow.pressed()
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

        onPressed: {
            notificationsViewRow.ListView.view.currentIndex = index
            notificationsViewRow.forceActiveFocus()
            mouse.accepted = false
        }
    }
}
