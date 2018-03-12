import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.1


Rectangle {
    id: newBuildingMenu
    height: 300
    border.color: "#b3b3b3"

    Behavior on x {
        NumberAnimation {
            //This specifies how long the animation takes
            duration: 600
            //This selects an easing curve to interpolate with, the default is Easing.Linear
            easing.type: Easing.OutBounce
        }
    }

    ColumnLayout {
        anchors.fill: newBuildingMenu
        Layout.leftMargin: 10

        ComboBox {
            id: countryBox
            currentIndex: -1
            displayText: currentIndex === -1 ? "SELECT COUNTRY" : countryBox.currentText
            model: ["Ukraine", "Poland", "Switherland", "Czeck Republic", "Moldova", "Hungery", "Germany"]
        }

        ComboBox {
            id: regionBox
            currentIndex: -1
            displayText: currentIndex === -1 ? "SELECT REGION" : regionBox.currentText
            model: ["Lviv", "Kyiv", "Ternopil", "Odesa", "Rivne", "Dnipro", "Kharkiv", "Uzhgorod"]
        }

        ComboBox {
            id: cityBox
            currentIndex: -1
            displayText: currentIndex === -1 ? "SELECT CITY" : cityBox.currentText
            model: ["Lviv", "Brody", "Novoyavorivsk", "Drogobych", "Chervonograd", "Yavoriv"]
        }

        ComboBox {
            id: buildingBox
            currentIndex: -1
            displayText: currentIndex === -1 ? "SELECT BUILDING" : buildingBox.currentText
            model: ["King Cross", "Airport", "Forum"]
        }

        Rectangle {
            id: addButton
            width: 75
            height: 40
            border.color: "#b3b3b3"

            Text {
                anchors.fill: addButton
                text: "Add"
                color: "#b3b3b3"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
