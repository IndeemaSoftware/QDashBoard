import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtGraphicalEffects 1.0

import "./ContentView"
import "./TopPanel"

Window {
    id: mainWindow
    visibility: "FullScreen"
    width: 1024
    height: 680
    title: qsTr("Scheindler iReDS")
    flags: Qt.FramelessWindowHint
    color: "white"

    minimumWidth: 1024
    minimumHeight: 680

    Column {
        anchors.topMargin: parent.topMargin
        anchors.verticalCenter: parent.verticalCenter
        spacing: 0

        TopPanel {
            id: topPanel
            width: mainWindow.width
            height: 70
            dashboardButtonState: "Pressed"
        }

        ContentView {
            id: contentView
            objectName:"contentView"
            height: mainWindow.height - topPanel.height
            width: mainWindow.width

            onLogedIn: {
                topPanel.showTopMenu(true);
            }

            onLogedOut: {
                topPanel.showTopMenu(false);
            }

            onShowNotificationDetails: {
                topPanel.dashboardButtonState = "Normal";
                topPanel.buildingsButtonState = "Pressed"
            }
        }
    }

    Connections {
        target: topPanel
        onDashboardClicked: {
            contentView.showBuildingsView(false);
            contentView.showDashboard(true);
        }
        onBuildingsClicked: {
            contentView.showDashboard(false);
            contentView.showBuildingsView(true);
        }

        onLogoutClicked: {
            contentView.showLoginView(true);
        }
    }
}
