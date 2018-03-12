import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.ListItems 1.0 as ListItem

Item {
    id: view

    property alias model: messagesList.model
    property bool itemSelected
    property Component delegate
    property alias masterWidth: messagesList.width
    property alias content: contentView.children
    property alias count: messagesList.count
    property string noneMessage: "No messages"
    property string noneSelected: "No message selected"
    property alias header: messagesList.header
    property alias footer: _footer.children

    property bool forceSidebar: false

    property Action action: null

    Label {
        opacity: 0.5
        fontSize: "large"
        text: noneMessage
        visible: messagesList.count === 0 && !forceSidebar
        anchors.centerIn: parent
    }

    Item {
        visible: messagesList.count > 0 || forceSidebar
        anchors.fill: parent

        Sidebar {
            id: sidebar
            width: Math.max(units.gu(30), Math.min(units.gu(40), view.width * 1/3))

            autoFlick: false

            ListView {
                id: messagesList
                anchors {
                    left: parent.left
                    right: parent.right
                    top: parent.top
                    bottom: _footer.top
                }


                clip: true
                delegate: view.delegate
            }

            Scrollbar {
                flickableItem: messagesList
            }



            Column {
                id: _footer

                visible: view.action

                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }

                Rectangle {
                    width: parent.width
                    height: addButton.height + units.gu(2)

                    ListItem.ThinDivider {
                        anchors.top: parent.top
                    }

                    color: Qt.rgba(0,0,0,0.2)

                    Button {
                        id: addButton
                        anchors.centerIn: parent
                        width: parent.width - units.gu(2)

                        text: view.action.text
                        enabled: view.action.enabled
                        onClicked: view.action.triggered(addButton)
                    }
                }
            }
        }

        Item {
            id: contents
            anchors {
                left: sidebar.right
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }

            Label {
                opacity: 0.5
                fontSize: "large"
                text: noneSelected
                visible: !itemSelected
                anchors.centerIn: parent
            }

            Item {
                id: contentView
                anchors.fill: parent
            }
        }
    }
}
