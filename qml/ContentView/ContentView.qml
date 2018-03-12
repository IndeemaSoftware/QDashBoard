import QtQuick 2.0

import "./Dashboard"
import "./Buildings"
import "./Login"

Rectangle {
    id: contentPanel

    signal logedIn
    signal logedOut
    signal showNotificationDetails();

    function showDashboard(show) {
        dashboardView.visible = show;
        buildingsView.visible = !show;
    }

    function showBuildingsView(show) {
        buildingsView.visible = show;
        dashboardView.visible = !show;
    }

    function showLoginView(show) {
        loginView.visible = show;
        buildingsView.visible = !show;
        dashboardView.visible = !show;
    }

    LoginView {
        id: loginView
        anchors.fill: contentPanel
        visible: true

        onLogedIn: {
            loginView.visible = false;
            dashboardView.visible = true;

            contentPanel.logedIn();
        }

        onLogedOut: {
            loginView.visible = true;
            dashboardView.visible = false;

            contentPanel.logedOut();
        }
    }

    DashboardView {
        id: dashboardView
        visible: false
        anchors.fill: contentPanel
    }

    BuildingsView {
        id: buildingsView
        anchors.fill: contentPanel
        visible: false
    }

    Rectangle {
        id: shadow1
        width: mainWindow.width
        height: 5
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0.5, 0.5, 0.5, 0.5); }
            GradientStop { position: 1.0; color: Qt.rgba(1, 1, 1, 0.0); }
        }
    }

    Connections {
        target: dashboardView
        onShowNotificationDetails: {
            contentView.showBuildingsView(true);
            buildingsView.showBuildingDetails();
            contentPanel.showNotificationDetails();
        }
    }
}
