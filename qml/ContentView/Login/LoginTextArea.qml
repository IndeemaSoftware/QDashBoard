import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: loginTextArea
    width: 365
    height: 40
    anchors.horizontalCenter: layout.horizontalCenter
    anchors.margins: 1

    property alias text: inputField.text
    property alias echoMode: inputField.echoMode
    property alias placeholderText: placeholderText.text
    property alias textInput: inputField
    property alias inputFocus: inputField.focus

    signal tabPressed();

    states :[
        State{
            name: "Normal"
            PropertyChanges {
                target: background
                source: "qrc:/resources/login/input.png"
            }
        },
        State{
            name:"Warning"
            PropertyChanges {
                target: background
                source: "qrc:/resources/login/warning_input.png"
            }
        }
    ]

    BorderImage {
        id: background
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/resources/login/input.png"
    }


    TextInput {
        id: inputField
        x: background.x + 10
        y: background.y + 10
        width: background.width - 20
        height: background.height - 20

        onActiveFocusChanged: {
            loginTextArea.state = "Normal"
        }

        Keys.onTabPressed: {
            loginTextArea.tabPressed();
        }
    }

    Text {
        id: placeholderText
        x: inputField.x
        y: inputField.y
        width: inputField.width
        height: inputField.height
        text: textEdit.placeholderText
        color: "#aaa"
        visible: !inputField.text
    }
}
