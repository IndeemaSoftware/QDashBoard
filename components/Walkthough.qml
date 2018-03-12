/***************************************************************************
 * Whatsoever ye do in word or deed, do all in the name of the             *
 * Lord Jesus, giving thanks to God and the Father by him.                 *
 * - Colossians 3:17                                                       *
 *                                                                         *
 * Ubuntu UI Extras - A collection of QML widgets not available            *
 *                    in the default Ubuntu UI Toolkit                     *
 * Copyright (C) 2013 Michael Spencer <sonrisesoftware@gmail.com>          *
 *                                                                         *
 * This program is free software: you can redistribute it and/or modify    *
 * it under the terms of the GNU General Public License as published by    *
 * the Free Software Foundation, either version 2 of the License, or       *
 * (at your option) any later version.                                     *
 *                                                                         *
 * This program is distributed in the hope that it will be useful,         *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the            *
 * GNU General Public License for more details.                            *
 *                                                                         *
 * You should have received a copy of the GNU General Public License       *
 * along with this program. If not, see <http://www.gnu.org/licenses/>.    *
 ***************************************************************************/
import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import Ubuntu.Components.ListItems 1.0 as ListItem

Page {
    id: root

    property list<Component> model

    property string appName
    property color completedPage
    property color incompletePage

    property bool exitable: false
    property bool swipingEnabled: true

    signal finished

    property bool showSkipButton: true
    property bool showFooter: true

    property alias currentIndex: listView.currentIndex
    property alias currentItem: listView.currentItem
    property alias pageCount: listView.count

    onFinished: {
        if (exitable) {
            pageStack.pop()
        } else {
            hideAnimation.start()
        }
    }

    SequentialAnimation {
        id: hideAnimation

        UbuntuNumberAnimation {
            duration: UbuntuAnimation.SlowDuration * 1/2
            target: root
            property: "opacity"
            from: 1; to: 0;
        }

        ScriptAction {
            script: {
                pageStack.pop(root)
            }
        }
    }

    Component.onCompleted: mainView.forceActiveFocus()

    Keys.onLeftPressed: {
        if (list.currentIndex > 0)
            list.currentIndex--
    }

    Keys.onRightPressed: {
        if (list.currentIndex < list.count - 1)
            list.currentIndex++
    }

    // Label to skip the walkthrough. Only visible on the first slide
    Label {
        id: skipLabel
        objectName:"skipButton"

        opacity: 0.5
        fontSize: "small"
        width: contentWidth
        text: listView.currentIndex === 0 ? i18n.tr("Already used %1? <b>Skip the tutorial</b>").arg(appName) : i18n.tr("Skip")

        visible: showSkipButton

        anchors {
            top: parent.top
            left: parent.left
            margins: units.gu(2)
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.finished()
        }
    }

    ListView {
        id: listView
        anchors {
            left: parent.left
            right: parent.right
            top: showSkipButton ? skipLabel.bottom : parent.top
            bottom: divider.top
        }

        model: root.model
        snapMode: ListView.SnapOneItem
        orientation: Qt.Horizontal
        highlightMoveDuration: UbuntuAnimation.FastDuration
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightFollowsCurrentItem: true
        interactive: swipingEnabled

        delegate: Item {
            width: listView.width
            height: listView.height
            clip: true

            Loader {
                anchors {
                    fill: parent
                    margins: units.gu(2)
                }

                sourceComponent: modelData
            }
        }
    }

    ListItem.ThinDivider {
        id: divider
        anchors.bottom: footer.top
    }

    Row {
        id: footer
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        height: units.gu(6)

        anchors.bottomMargin: showFooter ? 0 : -(footer.height + divider.height)

        Behavior on anchors.bottomMargin {
            UbuntuNumberAnimation {
                duration: UbuntuAnimation.SlowDuration
            }
        }

        spacing: (height - size)/2

        property real size: units.gu(2)

        Repeater {
            model: listView.count
            delegate: Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                width: footer.size
                height: width
                radius: width/2

                color: /*listView.currentIndex == index ? Qt.rgba(0,0,0,0.4) : */listView.currentIndex >= index ? colors["green"] : colors["default"]

                Behavior on color {
                    ColorAnimation {
                        duration: UbuntuAnimation.FastDuration
                    }
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        listView.currentIndex = index
                    }
                }
            }
        }
    }
}
