import QtQuick 2.0
import QtCharts 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id: parent

    function toMsecsSinceEpoch(date) {
        var msecs = date.getTime();
        return msecs;
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        ValueAxis {
            id: hiddenAxis
            labelsVisible: false
            gridVisible:false
            minorGridVisible: false
            tickCount: 0
        }

        TrendChart {
            id: xTrendChart
            Layout.fillHeight: true
            Layout.fillWidth: true

            LineSeries {
                name: "x"
            }
        }

        TrendChart {
            id: yTrendChart
            Layout.fillHeight: true
            Layout.fillWidth: true

            LineSeries {
                name: "y"
            }
        }

        TrendChart {
            id: zTrendChart
            Layout.fillHeight: true
            Layout.fillWidth: true

            LineSeries {
                name: "z"
            }
        }
    }
}
