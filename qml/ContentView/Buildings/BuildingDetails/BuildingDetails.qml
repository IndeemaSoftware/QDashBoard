import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.1

import "../../../TopPanel/"

Rectangle {
    id: buildingContectView

    Rectangle {
        id: pathStory
        x: 0
        y: 0
        width: buildingContectView.width
        height: 50

        Text {
            anchors.fill: pathStory
            verticalAlignment: Text.AlignVCenter
            text: "/Buildings/Ukraine/Lviv Region/Lviv/King Cross/Escalator#1"
            color: "#b3b3b3"
        }

        Rectangle {
            id: shadow1
            x: 0
            y: pathStory.height - 5
            width: pathStory.width
            height: 5

            rotation: 180

            gradient: Gradient {
                GradientStop { position: 0.0; color: Qt.rgba(0.5, 0.5, 0.5, 0.5); }
                GradientStop { position: 1.0; color: Qt.rgba(1, 1, 1, 0.0); }
            }
        }
    }

    GridLayout {
        x: 0
        y: pathStory.y + pathStory.height
        width: buildingContectView.width
        height: buildingContectView.height - pathStory.height
        columns: 2
        rows: 3

        Rectangle {
            id: controlPanel
            Layout.column: 0
            Layout.row: 2

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumHeight: 100

            RowLayout {
                MenuButton {
                    id: trendButton
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    buttonText: qsTr("Trend")
                    state: "Normal"
                    onClicked: {
                        objectPreview.visible = false
                        buildingPlan.visible = false

                        trendView.visible = true
                    }
                }

                MenuButton {
                    id: objectButton
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    buttonText: qsTr("Object")
                    state: "Pressed"
                    onClicked: {
                        objectPreview.visible = true
                        buildingPlan.visible = true

                        trendView.visible = false
                    }
                }
            }
            Text {
                width: 75
                height: 40
                anchors.verticalCenter: controlPanel.verticalCenter
                anchors.right: floorsCombo.left
                text: "SHOW"
                color: "#b3b3b3"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

            }

            Rectangle {
                id: floorsCombo
                width: 150
                height: 40
                anchors.verticalCenter: controlPanel.verticalCenter
                anchors.right: controlPanel.right
                color: "transparent"

                ComboBox {
                    model: ["First Floor"]
                }
            }
        }

        TrendView {
            id: trendView
            Layout.column: 0
            Layout.row: 3
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
        }

        ObjectPreview {
            id: objectPreview
            Layout.column: 0
            Layout.row: 3

            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        BuildingPreview {
            id: buildingPlan
            anchors.top: parent.top
            Layout.column: 1
            Layout.row: 3

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 280
            Layout.maximumHeight: 280
        }
    }
}
