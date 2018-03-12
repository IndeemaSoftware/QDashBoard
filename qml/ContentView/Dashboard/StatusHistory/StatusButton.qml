//Import the declarative plugins
import QtQuick 2.0

//Implementation of the Button control.
Item {
    id: button
    width: 200
    height: 100
    property alias updateBackgourndImage: backgoundImage.source
    property alias updateTextColor: innerText.color
    property alias buttonText: innerText.text;
    property alias state: button.state

    property color color: "transparent"
    property color hoverColor: "#aaaaaa"
    property color pressColor: "slategray"

    property string imageNormal: "qrc:/resources/buttons/buttonNormal.png"
    property string imageHover: "qrc:/resources/buttons/buttonSelect.png"
    property string imagePressed: "qrc:/resources/buttons/buttonPressed.png"

    property int fontSize: 15
    property color fontColor: Qt.rgba(1, 1, 1, 0.5);
    property color fontColorPressed: "white"
    property color fontColorHover: Qt.rgba(1, 1, 1, 0.7);
    onEnabledChanged: state = ""
    signal clicked

    //Button image

    Image {
        id: backgoundImage
        anchors.fill: parent
        source: imageNormal
    }

    //button text
    Text {
        id: innerText
        font.pointSize: fontSize
        anchors.centerIn: parent
        color: fontColor
    }

    //change the color of the button in differen button states
    states: [
        State {
            name: "Hovering"
            PropertyChanges {
                target: button
                color: hoverColor
                updateBackgourndImage: imageHover
                updateTextColor: fontColorHover
            }
        },
        State {
            name: "Pressed"
            PropertyChanges {
                target: button
                color: pressColor
                updateBackgourndImage: imagePressed
                updateTextColor: fontColorPressed
            }
        },
        State {
            name: "Normal"
            PropertyChanges {
                target: button
                color: color
                updateBackgourndImage: imageNormal
                updateTextColor: fontColor
            }
        }
    ]

    //define transmission for the states
    transitions: [
        Transition {
            from: "Normal"; to: "Hovering"
            ColorAnimation { duration: 100 }
        },
        Transition {
            from: "*"; to: "Pressed"
            ColorAnimation { duration: 100 }
        },
        Transition {
            from: "Pressed"; to: "Normal"
            ColorAnimation { duration: 100 }
        },
        Transition {
            from: "Hovering"; to: "Normal"
            ColorAnimation { duration: 100 }
        }
    ]

    //Mouse area to react on click events
    MouseArea {
        propagateComposedEvents: true
        hoverEnabled: true
        anchors.fill: button

        onEntered: {
            if (button.state != "Pressed") {
                button.state = 'Hovering'
            }
        }

        onExited: {
            if (button.state === 'Hovering') {
                button.state='Normal'
            }
        }

        onPressed: {
            button.state= "Pressed"
            button.clicked();
            mouse.accepted = false
        }
    }
}
