import QtQuick 2.5

Rectangle {
    id: container;

    property alias text: bodyText.text

    function goForIt(parent) {
//        container.height = 300;
        bounceAnimation.start();
    }
    border.color:"#b3b3b3"

    Text {
        id: bodyText
        y: 10
        color: "#b3b3b3"
        anchors.fill: container
        verticalAlignment: Text.AlignVCenter
    }

    MouseArea {
        anchors.fill: parent
        onClicked: goForIt(parent);
    }

    Behavior on y {
        PropertyAnimation {
            target: container;
            properties: "y";
            duration: 1000;
        }
    }

    transform: Scale {
        id: scaleTransform
        property real scale: 1
        yScale: scale
    }

    SequentialAnimation {
        id: bounceAnimation
        loops: 1
        PropertyAnimation {
            target: scaleTransform
            properties: "scale"
            from: 1.0
            to: 2.0
            duration: 1000
        }
        PropertyAnimation {
            target: scaleTransform
            properties: "scale"
            from: 2.0
            to: 1.0
            duration: 1000
        }
    }
}
