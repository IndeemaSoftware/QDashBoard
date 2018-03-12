import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

import "./NewBuilding"
import "./BuildingDetails"
import "../../Map"
import "../../CustomComponents"

import QtPositioning 5.5
import QtLocation 5.6

Rectangle {
    id: buildingsView
    objectName: "buildingsView"

    function showBuildingDetails() {
        buildingDetailsView.visible = true;
        buildingObjectsListPanel.visible = true;

        buildingsView.showNewBuildingMenuAppearance()
    }

    function showNewBuildingMenuAppearance() {
        if (newBuildingMenu.x < 0) {
            addButton.text = "Hide"
            newBuildingMenu.x = 0;

            mapView.visible = true;
            buildingDetailsView.visible = false;
        } else {
            addButton.text = "Add+"
            newBuildingMenu.x = -sideMenu.width;

            if (buildingObjectsListPanel.visible) {
                mapView.visible = false;
                buildingDetailsView.visible = true;

            }
        }
    }

    //-----side menu
    Rectangle {
        id: sideMenu
        width: 356
        height: buildingsView.height

        ColumnLayout {
            spacing: 0
            Rectangle {
                id: buildingObjectsListPanel
                width: sideMenu.width
                height: 300
                border.color: "#b3b3b3"
                visible: false

                BuildingObjectsList {
                    id: buildingObjectsList
                    y: 40
                    width: sideMenu.width
                    height: 300
                }
            }

            //-----new building view
            Rectangle {
                id: panelButton
                y: 20
                width: sideMenu.width
                height: 40
                border.color: "#b3b3b3"

                Component.onCompleted: {
                    if (!newBuildingMenu.visible) {
                        newBuildingMenu.x = -sideMenu.width;
                        newBuildingMenu.visible = true;
                    }
                }

                Text {
                    id: bodyText
                    x: 10
                    width: 50
                    height: panelButton.height
                    color: "#b3b3b3"
                    verticalAlignment: Text.AlignVCenter
                    text: "NEW BUILDING"
                }

                Button {
                    id: addButton
                    anchors.right: panelButton.right
                    text: "Hide"

                    onPressed: {
                        showNewBuildingMenuAppearance();
                    }
                }
            }
            NewBuildingMenu {
                id: newBuildingMenu

                x: -sideMenu.width
                width: sideMenu.width
                height: 300
                visible: true
            }
            //---end of new building view
        }
        //end of side menu

        //content view
        Rectangle {
            id: buildingContentView
            x: sideMenu.x + sideMenu.width
            y: sideMenu.y
            width: buildingsView.width - sideMenu.width
            height: buildingsView.height
            color: "red"


            //---------------------------
            GlobalMap {
                id: mapView
                width: buildingContentView.width
                height: buildingContentView.height
            }
            //--------------------------------


            BuildingDetails {
                id: buildingDetailsView
                x:0
                y: 0
                width: buildingContentView.width
                height: buildingContentView.height
                visible: false
            }

            Rectangle {
                id: shadow1
                x: 0
                y: 0
                width: 5
                height: buildingContentView.height
                color: "transparent"

                LinearGradient {
                    anchors.fill: parent
                    start: Qt.point(0, 0)
                    end: Qt.point(5, 0)
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: Qt.rgba(0.5, 0.5, 0.5, 0.5); }
                        GradientStop { position: 1.0; color: Qt.rgba(1, 1, 1, 0.0); }
                    }
                }
            }
        }
        //end of content view
    }
}
