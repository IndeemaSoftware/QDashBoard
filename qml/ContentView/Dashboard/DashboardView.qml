import QtQuick 2.0
import QtQuick.Layouts 1.0

import "./StatusHistory"
import "./NotificationsView"

Rectangle {
    id: dashboardView
    objectName: "dashboardView"

    color: "white"

    signal showNotificationDetails;

    ColumnLayout {
        anchors.top: parent.top
        anchors.fill: parent
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 0
        spacing: 0

        StatusHistory {
            id: statusHistory
            Layout.fillWidth: true
            height: 500
        }

        //shadow under the panel
        Rectangle {
            id: shadow2
            Layout.fillWidth: true
            height: 5
            gradient: Gradient {
                GradientStop { position: 0.0; color: Qt.rgba(0.5, 0.5, 0.5, 0.5); }
                GradientStop { position: 1.0; color: Qt.rgba(1, 1, 1, 0.0); }
            }
        }

        Rectangle {
            id: spacing
            Layout.fillWidth: true
            height: 20
            color: "white"
        }

        //shadow under the panel
        Rectangle {
            id: shadow3
            Layout.fillWidth: true
            height: 5
            gradient: Gradient {
                GradientStop { position: 0.0; color: Qt.rgba(1, 1, 1, 0.0); }
                GradientStop { position: 1.0; color: Qt.rgba(0.5, 0.5, 0.5, 0.5); }
            }
        }

        NotificationsView {
            id: notificationsView
            Layout.fillWidth: true
            Layout.fillHeight: true

            onShowDetailsPressed: {
                dashboardView.showNotificationDetails()
            }
        }
    }
}
