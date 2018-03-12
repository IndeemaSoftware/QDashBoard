import QtQuick 2.0
import QtQuick.Layouts 1.0

Rectangle{
    id: notificationsView
    property int cellWidth: 180
    property int cellHeight: 50
    color: "white"

    signal showDetailsPressed()

    Component {
        id: listDelegate
        NotificationsViewRow {
            id: wrapper
            width: notificationsView.width
            cellWidth: notificationsView.cellWidth
            cellHeight: notificationsView.cellHeight

            color: ListView.isCurrentItem ? "#b3b3b3" : "transparent"
            detailedVisible: ListView.isCurrentItem

            onPressed: {
                notificationsView.showDetailsPressed()
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        NotificationsFilter {
            height: 50
            anchors.right: parent.right
            anchors.left: parent.left
            Layout.fillWidth: true
        }

        Rectangle{
            id: header
            anchors.right: parent.right
            anchors.left: parent.left
            Layout.fillWidth: true
            height: 30

            Row {
                spacing: 0

                Text {y: 5; width:cellWidth; text: qsTr("State")}
                Text {y: 5; width:cellWidth; text: qsTr("Country")}
                Text {y: 5; width:cellWidth; text: qsTr("Region")}
                Text {y: 5; width:cellWidth; text: qsTr("City")}
                Text {y: 5; width:cellWidth; text: qsTr("Building")}
                Text {y: 5; width:cellWidth; text: qsTr("Date")}
            }
        }

        ListView {
            id: listView
            z: -1
            anchors.right: parent.right
            anchors.left: parent.left
            Layout.fillHeight: true
            Layout.fillWidth: true

            currentIndex: -1
            model: 20
            delegate: listDelegate
            focus: false
        }
    }

}
