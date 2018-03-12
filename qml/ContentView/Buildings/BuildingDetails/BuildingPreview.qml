import QtQuick 2.0

Rectangle {
    id: buildingPreview

    Image {
        anchors.verticalCenter: buildingPreview.verticalCenter
        anchors.horizontalCenter: buildingPreview.horizontalCenter
        width: 253
        height: 189
        source: "qrc:/resources/building/floor_plan.png"
    }
}
