import QtQuick 2.0
import QtQuick.Dialogs 1.2
import Qt.labs.calendar 1.0
import QtQuick.Controls 2.1

Dialog {
    id: dialogCalendar
    // Set the size of the dialog
    width: 250
    height: 300

    // Create the dialog box content
    contentItem: Rectangle {
        id: dialogRect
        color: "#f7f7f7"

        ListView {
            id: listview

            width: 200; height: 200
            snapMode: ListView.SnapOneItem
            orientation: ListView.Horizontal
            highlightRangeMode: ListView.StrictlyEnforceRange

            model: CalendarModel {
                from: new Date(2015, 0, 1)
                to: new Date(2015, 11, 31)
            }

            delegate: MonthGrid {
                width: listview.width
                height: listview.height

                month: model.month
                year: model.year
                locale: Qt.locale("en_US")
            }

            ScrollIndicator.horizontal: ScrollIndicator { }
        }
    }
}
