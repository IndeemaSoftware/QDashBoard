import QtQuick 2.0
import QtCharts 2.2
import QtQuick.Layouts 1.0

Rectangle {
    id: pieChart
    Layout.column: 0
    Layout.row: 0

    Layout.fillHeight: true

    ColumnLayout {
        width: pieChart.width
        anchors.right: parent.right
        anchors.left: parent.left
        Layout.fillHeight: true
        anchors.top: parent.top
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 0
        spacing: 20

        Rectangle {
            x: 60;
            height: 30
            width: 80

            Text {x: 20; y: 10; text:"July 17"; color: "#b3b3b3"; font.family: "Raleway SemiBold"; font.pointSize: 13}
        }

        ChartView {
            width: pieChart.width
            height: pieChart.width
            legend.visible: false
            antialiasing: true
            animationOptions: ChartView.SeriesAnimations
            backgroundColor: "transparent"

            PieSeries {
                id: pieSeries
                size:1
                holeSize: 0.25

                PieSlice {id: gray; value: 83; color: "#b3b3b3"}
                PieSlice {id: red; value: 115; color: "#e40b0b"}
                PieSlice {id: yellow; value: 867; color: "#ffa300"}
                PieSlice {id: green; value: 2400; color: "#37a401"}
            }
        }

        Rectangle {
            id: customLegend
            width: parent.width
            height: 100

            Column {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 15

                RowLayout {
                    ColumnLayout {
                        spacing: 15
                        Rectangle {width: 18; height: 18; color: "#b3b3b3"; radius:15}
                        Rectangle {width: 18; height: 18; color: "#e40b0b"; radius:15}
                        Rectangle {width: 18; height: 18; color: "#ffa300"; radius:15}
                        Rectangle {width: 18; height: 18; color: "#37a401"; radius:15}
                    }

                    ColumnLayout {
                        spacing: 15
                        Text{height: 15; text: gray.value; color: "#b3b3b3"; font.family: "Raleway ExtraBold"; font.pointSize: 11}
                        Text{height: 15; text: red.value; color: "#e40b0b"; font.family: "Raleway ExtraBold"; font.pointSize: 11}
                        Text{height: 15; text: yellow.value; color: "#ffa300"; font.family: "Raleway ExtraBold"; font.pointSize: 11}
                        Text{height: 15; text: green.value; color: "#37a401"; font.family: "Raleway ExtraBold"; font.pointSize: 11}
                    }

                    ColumnLayout {
                        spacing: 15
                        Text{height: 15; text:"No Signal"; color: "#5b6476"; font.family: "Raleway SemiBold"; font.pointSize: 11}
                        Text{height: 15; text:"Danger"; color: "#5b6476"; font.family: "Raleway SemiBold"; font.pointSize: 11}
                        Text{height: 15; text:"Warning"; color: "#5b6476"; font.family: "Raleway SemiBold"; font.pointSize: 11}
                        Text{height: 15; text:"Good"; color: "#5b6476"; font.family: "Raleway SemiBold"; font.pointSize: 11}
                    }

                }
            }
        }

        Item {
            // spacer item
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
