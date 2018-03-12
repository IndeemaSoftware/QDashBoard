import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQml.Models 2.2

Item {
    ItemSelectionModel {
        id: sel
//        model: treeModel
    }

    TreeView {
        id: buildingObjectsList
        objectName: "buildingObjectsList"
//        model: treeModel
        anchors.fill: parent

        TableViewColumn {
            title: "Name"
            role: "fileName"
            width: 200
        }

        TableViewColumn {
            title: "Description"
            role: "filePermissions"
            width: 100
        }
    }
}
