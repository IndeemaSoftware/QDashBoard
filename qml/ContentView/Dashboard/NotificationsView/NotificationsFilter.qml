import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Dialogs 1.2
import Qt.labs.calendar 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0

import "../StatusHistory"

Rectangle {
    id: buttonsPanel
    property var tempDate: new Date();

    DatePicker {
        id: dialogCalendar
        width: 250
        height: 300
    }

    RowLayout {
        anchors.fill: parent
        spacing: 10

        Text {
            x: 10
            height: 40
            width: 200
            font.pointSize: 13
            text: "Latest Notifications"
        }

        StatusButton {
            id: allButton
            height: 40
            width: 157
            fontSize: 12
            fontColor: Qt.rgba(0.3, 0.3, 0.3, 0.5);
            fontColorPressed: "black"
            fontColorHover: Qt.rgba(0.1, 0.1, 0.1, 0.7);

            imageNormal: "qrc:/resources/buttons_filter/button_all_normal.png"
            imageHover: "qrc:/resources/buttons_filter/button_all_hover.png"
            imagePressed: "qrc:/resources/buttons_filter/button_all_pressed.png"

            onClicked: {
                trendChartView.disableAll();

                state = "Pressed"

                goodPlot.width = 2;
                goodPlot.color = "#37a401"
            }
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

        Rectangle {
            width: 200
            height: 40
            ComboBox {
                model: ["All Countries", "US", "Ukraine", "China", "Poland", "Switherland"]
            }
        }

        Rectangle {
            id: pickerButton
            width: 100
            height: 40

            Text {
                width:pickerButton.width
                height: pickerButton.height
                text: tempDate.toDateString()
                verticalAlignment: Text.AlignVCenter
            }

            MouseArea {
                propagateComposedEvents: true
                hoverEnabled: true
                anchors.fill: pickerButton

                onPressed: {
                    dialogCalendar.x = pickerButton.x
                    dialogCalendar.y = pickerButton.y
                    dialogCalendar.visible = true
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
