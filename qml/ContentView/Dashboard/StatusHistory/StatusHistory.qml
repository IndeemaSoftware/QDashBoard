import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

Rectangle {
    id: dashBoard

    GridLayout {
        anchors.fill: parent
        columns: 4
        rows: 1

        PieChartView {
            id: pieChart
            Layout.column: 0
            Layout.row: 0

            width:300
            Layout.fillHeight: true
        }

        TrendChartView {
            id: trandChart
            Layout.column: 4
            Layout.row: 0

            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
