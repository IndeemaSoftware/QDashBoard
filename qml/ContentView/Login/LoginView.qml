import QtQuick 2.0
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.4

import "../../TopPanel"

Rectangle {
    id: loginView
    objectName: "loginView"

    color: Qt.rgba(0.925, 0.945, 0.976, 1)

    function showWrongCredentials(){
        warningView.visible = true;
    }

    function hideWrongCredentials(){
        warningView.visible = false;
    }

    signal logedIn();
    signal logedOut();
    signal loginPressed(string login, string password);

    DropShadow {
        anchors.fill: centralView
        horizontalOffset: 0
        verticalOffset: 0
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: centralView
    }

    Rectangle {
        id: centralView
        anchors.horizontalCenter: loginView.horizontalCenter
        anchors.verticalCenter: loginView.verticalCenter
        width: 700;
        height: 400
        color: "white"

        Rectangle {
            id: borderView
            width: 600
            height: 300
            anchors.horizontalCenter: centralView.horizontalCenter
            anchors.verticalCenter: centralView.verticalCenter

            ColumnLayout {
                id: layout
                anchors.fill: borderView
                spacing: 30

                Text {
                    anchors.horizontalCenter: layout.horizontalCenter
                    text: "Please use your credentials to login"
                    color: "gray"
                    font.pointSize: 14
                }

                LoginTextArea {
                    id: loginTextArea
                    width: 365
                    height: 40
                    anchors.horizontalCenter: layout.horizontalCenter
                    placeholderText: qsTr("User Name")

                    onTabPressed: {
                        passwordTextArea.inputFocus = true;
                    }
                }

                LoginTextArea {
                    id: passwordTextArea
                    width: 365
                    height: 40

                    echoMode: TextInput.Password
                    anchors.horizontalCenter: layout.horizontalCenter
                    placeholderText: qsTr("Password")
                    anchors.margins: 1
                    onTabPressed: {
                        loginButtonImage.focus = true;
                    }
                }

                MenuButton {
                    id: loginButtonImage
                    width: 369
                    height: 40
                    anchors.horizontalCenter: layout.horizontalCenter
                    imageNormal: "qrc:/resources/login/login_normal_button.png"
                    imageHover: "qrc:/resources/login/login_hover_button.png"
                    imagePressed: "qrc:/resources/login/login_pressed_button.png"

                    onClicked: {
                        var login = true;

                        hideWrongCredentials();

                        if (loginTextArea.text === "") {
                            loginTextArea.state = "Warning"
                            login = false;
                        }

                        if (passwordTextArea.text === "") {
                            passwordTextArea.state = "Warning"
                            login = false;
                        }

                        if (login) {
                            logedIn();
                        }
                    }

                    onReleased: {
                        loginButtonImage.state = 'Normal'
                    }
                }

                Rectangle {
                    id: warningView
                    width: 400
                    anchors.horizontalCenter: layout.horizontalCenter
                    Layout.fillHeight: true
                    visible: false

                    Image {
                        id: icon
                        source: "qrc:/resources/login/warning_icon.png"
                    }

                    Text {
                        x: icon.width
                        color: "red"
                        text: "You are using wrong credentials."
                    }
                }

                Item {
                    id: spacer
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }
    }
}
