import QtQuick 2.0
import QtCharts 2.0
import QtQuick.Layouts 1.0


Rectangle {
    id: trendChartView

    function disableAll(){
        dangerPlot.width = 1;
        dangerPlot.color = Qt.rgba(1, 0, 0, 0.25)

        warningPlot.width = 1;
        warningPlot.color = Qt.rgba(1, 0.6, 0, 0.25)

        goodPlot.width = 1;
        goodPlot.color = Qt.rgba(0, 1, 0, 0.25)

        noSignalPlot.width = 1;
        noSignalPlot.color = Qt.rgba(0.1, 0.1, 0.1, 0.25)

        grayButton.state = "Normal"
        redButton.state = "Normal"
        yellowButton.state = "Normal"
        greenButton.state = "Normal"
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            anchors.right: parent.right
            anchors.left: parent.left
            Layout.fillHeight: true
            Layout.fillWidth: true
            antialiasing: true

            Rectangle {
                id: buttonsPanel
                x: 0
                y: 10
                width: parent.width
                height:50

                RowLayout {
                    anchors.fill: parent
                    spacing: 10

                    Rectangle {
                        id: spacerLeft
                        x: 0
                        y: 0
                        width: 50
                        height: parent.height
                    }

                    StatusButton {
                        id:grayButton
                        height: 40
                        width: 157
                        buttonText: "No Signal"
                        fontSize: 12
                        fontColor: Qt.rgba(0.3, 0.3, 0.3, 0.5);
                        fontColorPressed: "black"
                        fontColorHover: Qt.rgba(0.1, 0.1, 0.1, 0.7);

                        imageNormal: "qrc:/resources/buttons_filter/No_signal_normal.png"
                        imageHover: "qrc:/resources/buttons_filter/No_signal_Hover.png"
                        imagePressed: "qrc:/resources/buttons_filter/No_signal_Pressed.png"

                        onClicked: {
                            trendChartView.disableAll();

                            state = "Pressed"

                            noSignalPlot.width = 2;
                            noSignalPlot.color = "#b3b3b3"
                        }
                    }

                    StatusButton {
                        id: redButton
                        height: 40
                        width: 157
                        buttonText: "Danger"
                        fontSize: 12
                        fontColor: Qt.rgba(0.3, 0.3, 0.3, 0.5);
                        fontColorPressed: "black"
                        fontColorHover: Qt.rgba(0.1, 0.1, 0.1, 0.7);
                        state: "Pressed"

                        imageNormal: "qrc:/resources/buttons_filter/Danger_normal.png"
                        imageHover: "qrc:/resources/buttons_filter/Danger_Hover.png"
                        imagePressed: "qrc:/resources/buttons_filter/Danger_Pressed.png"

                        onClicked: {
                            trendChartView.disableAll();

                            state = "Pressed"

                            dangerPlot.width = 2;
                            dangerPlot.color = "#e40b0b"
                        }
                    }

                    StatusButton {
                        id: yellowButton
                        height: 40
                        width: 157
                        buttonText: "Problem"
                        fontSize: 12
                        fontColor: Qt.rgba(0.3, 0.3, 0.3, 0.5);
                        fontColorPressed: "black"
                        fontColorHover: Qt.rgba(0.1, 0.1, 0.1, 0.7);

                        imageNormal: "qrc:/resources/buttons_filter/Problem_normal.png"
                        imageHover: "qrc:/resources/buttons_filter/Problem_Hover.png"
                        imagePressed: "qrc:/resources/buttons_filter/Problem_Pressed.png"

                        onClicked: {
                            trendChartView.disableAll();

                            state = "Pressed"

                            warningPlot.width = 2;
                            warningPlot.color = "#ffa300"
                        }
                    }

                    StatusButton {
                        id: greenButton
                        height: 40
                        width: 157
                        buttonText: "Good"
                        fontSize: 12
                        fontColor: Qt.rgba(0.3, 0.3, 0.3, 0.5);
                        fontColorPressed: "black"
                        fontColorHover: Qt.rgba(0.1, 0.1, 0.1, 0.7);

                        imageNormal: "qrc:/resources/buttons_filter/Good_normal.png"
                        imageHover: "qrc:/resources/buttons_filter/Good_Hover.png"
                        imagePressed: "qrc:/resources/buttons_filter/Good_Pressed.png"

                        onClicked: {
                            trendChartView.disableAll();

                            state = "Pressed"

                            goodPlot.width = 2;
                            goodPlot.color = "#37a401"
                        }
                    }

                    Item {
                        // spacer item
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                }
            }

            ChartView {
                id: chartView
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height - buttonsPanel.height
                legend.visible: false
                antialiasing: true

                function toMsecsSinceEpoch(date) {
                    var msecs = date.getTime();
                    return msecs;
                }

                ValueAxis {
                    id: hiddenAxis
                    labelsVisible: false
                    gridVisible:false
                    minorGridVisible: false
                    tickCount: 0
                }


                ValueAxis {
                    id: yAxis
                    min: 50
                    max: 2500
                }

                LineSeries {
                    id: dangerPlot
                    name: "Danger"
                    color: "#e40b0b"
                    width: 2

                    axisX: DateTimeAxis {
                        format: "ddd dd"
                        tickCount: 11
                    }

                    axisY: yAxis

                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 5)); y: 254}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 8)); y: 243}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 9)); y: 233}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 10)); y: 222}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 11)); y: 211}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 12)); y: 202}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 13)); y: 169}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 14)); y: 155}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 15)); y: 147}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 16)); y: 120}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 17)); y: 115}
                }

                LineSeries {
                    id: warningPlot
                    name: "Warning"
                    color: Qt.rgba(0, 1, 0, 0.25)

                    axisX: hiddenAxis
                    axisY: yAxis

                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 5)); y: 812}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 8)); y: 810}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 9)); y: 820}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 10)); y: 860}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 11)); y: 867}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 12)); y: 873}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 13)); y: 871}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 14)); y: 865}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 15)); y: 857}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 16)); y: 860}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 17)); y: 867}
                }

                LineSeries {
                    id: goodPlot
                    name: "Good"
                    color: Qt.rgba(1, 0.6, 0, 0.25)

                    axisX: hiddenAxis
                    axisY: yAxis

                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 5)); y: 1998}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 8)); y: 2012}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 9)); y: 2071}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 10)); y: 2150}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 11)); y: 2165}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 12)); y: 2200}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 13)); y: 2219}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 14)); y: 2251}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 15)); y: 2310}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 16)); y: 2394}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 17)); y: 2400}
                }

                LineSeries {
                    id: noSignalPlot
                    name: "No Signal"
                    color: Qt.rgba(0.1, 0.1, 0.1, 0.25)

                    axisX: hiddenAxis
                    axisY: yAxis

                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 5)); y: 82}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 8)); y: 83}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 9)); y: 85}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 10)); y: 83}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 11)); y: 84}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 12)); y: 86}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 13)); y: 84}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 14)); y: 85}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 15)); y: 83}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 16)); y: 84}
                    XYPoint { x: chartView.toMsecsSinceEpoch(new Date(2017, 7, 17)); y: 83}
                }
            }
        }
    }
}

