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

/*!
    \qmltype Sidebar
    \brief A sidebar component for use in adaptive layouts

    To use, simply add an instance to your code, and anchor other components to it.

    To show or hide, set the expanded property.

    By default, the sidebar has a flickable built in, and whatever contents are added
    will be placed in the flickable. When you want this disabled, or want to fill the
    entire sidebar, set the autoFill property to false.

    Examples:
    \qml
        property bool wideAspect: width > units.gu(80)

        Sidebar {
            expanded: wideAspect

            // Anchoring is automatic
        }
    \endqml
*/
Rectangle {
    id: root

    color: Qt.rgba(0.2,0.2,0.2,0.6)

    property bool expanded: true

    function toggle() {
        expanded = !expanded
    }

    property string mode: "left" // or "right"
    property alias header: headerItem.text

    property alias dividerColor: divider.color

    anchors {
        left: mode === "left" ? parent.left : undefined
        right: mode === "right" ? parent.right : undefined
        top: parent.top
        bottom: parent.bottom
    }

    VerticalDivider {
        id: divider
        mode: root.mode

        anchors {
            top: parent.top
            bottom: parent.bottom
            right: mode === "left" ? parent.right : undefined
            left: mode === "right" ? parent.left : undefined
            //rightMargin: -1
        }
    }

    width: units.gu(35)


    anchors.leftMargin: expanded ? 0 : -width
    anchors.rightMargin: expanded ? 0 : -width

    Behavior on anchors.leftMargin {
        UbuntuNumberAnimation {}
    }

    Behavior on anchors.rightMargin {
        UbuntuNumberAnimation {}
    }

    default property alias contents: contents.data

    Header {
        id: headerItem

        visible: text !== ""
    }

    property bool autoFlick: true

    Flickable {
        id: flickable

        clip: true

        anchors {
            top: headerItem.visible ? headerItem.bottom : parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            rightMargin: mode === "left" ? 1 : 0
            leftMargin: mode === "right" ? 1 : 0
        }

        contentWidth: width
        contentHeight: autoFlick ? contents.height : height
        interactive: contentHeight > height

        Item {
            id: contents

            width: flickable.width
            height: autoFlick ? childrenRect.height : flickable.height
        }

        function getFlickableChild(item) {
            if (item && item.hasOwnProperty("children")) {
                for (var i=0; i < item.children.length; i++) {
                    var child = item.children[i];
                    if (internal.isVerticalFlickable(child)) {
                        if (child.anchors.top === projectPage.top || child.anchors.fill === projectPage) {
                            return item.children[i];
                        }
                    }
                }
            }
            return null;
        }
    }

    Scrollbar {
        flickableItem: flickable
    }
}
