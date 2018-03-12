import QtQuick 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id: objectPreview

    property var names: ["ID", "Name", "Master Device", "Recording duration", "Sampling Frequency", "Acceleration Range", "Machinary Class"]
    property var values: ["1", "Sample Name", "B8:27:C2:45:FT:B7", "5", "2000", "1", "2"]

    Image {
        id: image
        anchors.verticalCenter: objectPreview.verticalCenter
        anchors.horizontalCenter: objectPreview.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "qrc:/resources/building/escalator_up.png"
    }

    Rectangle {
        id: objectDetailsView
        x: 20
        y: objectPreview.height - objectDetailsView.height - 20
        width: 300
        height: 200
        border.color: "#b3b3b3"

        ColumnLayout {
            anchors.fill: objectDetailsView
            spacing: 0

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "transparent"
                Text {
                    x: 10
                    height: 25;
                    Layout.fillWidth: true
                    text: "Unit Info"
                    color: "#b3b3b3"
                    font.bold: true
                    font.pointSize: 11
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Repeater {
                model: names.length
                Rectangle {
                    id: rowView
                    y: 5
                    height: 25;
                    Layout.fillWidth: true

                    Row {
                        x: 10
                        spacing: 20
                        Text { verticalAlignment: Text.AlignVCenter; width:130; height: rowView.height; text: names[index]; color: "#b3b3b3" }
                        Text { verticalAlignment: Text.AlignVCenter; height: rowView.height; text: values[index]; color: "#b3b3b3" }
                    }

                    border.color: Qt.rgba(0.2, 0.2, 0.2, 0.1);
                    border.width: 1
                }
            }
        }
    }
}
