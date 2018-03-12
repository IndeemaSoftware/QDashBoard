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
import Ubuntu.Components.ListItems 1.0

// Widget based on code from Clock app
Rectangle {
    id: swipeBackgroundItem

    property url iconSource
    property string text

    anchors.fill: parent
    //color: Theme.palette.normal.base;
    anchors.bottomMargin: units.dp(2)
    color: Qt.rgba(0,0,0,0.3)
    property color fontColor: Theme.palette.normal.baseText//Theme.palette.selected.backgroundText

    Image {
        id: leftSwipeDeleteIcon

        anchors {
            top: leftSwipeBackgroundText.top
            right: leftSwipeBackgroundText.left
            rightMargin: units.gu(1)
            bottom: leftSwipeBackgroundText.bottom
        }
        source: swipeBackgroundItem.iconSource
        width: height
        visible: swipeBackgroundItem.state === "SwipingRight"
    }

    Label {
        id: leftSwipeBackgroundText
        visible: swipeBackgroundItem.state === "SwipingRight"
        text: swipeBackgroundItem.text
        color: fontColor

        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: units.gu(2)
        }

        fontSize: "large"
    }


    Image {
        id: rightSwipeDeleteIcon
        source: swipeBackgroundItem.iconSource

        anchors {
            top: rightSwipeBackgroundText.top
            left: rightSwipeBackgroundText.right
            leftMargin: units.gu(1)
            bottom: rightSwipeBackgroundText.bottom
        }
        width: height
        visible: swipeBackgroundItem.state === "SwipingLeft"
    }

    Label {
        id: rightSwipeBackgroundText
        visible: swipeBackgroundItem.state === "SwipingLeft"
        text: swipeBackgroundItem.text
        color: fontColor

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: units.gu(2)
        }

        fontSize: "large"
    }
}
