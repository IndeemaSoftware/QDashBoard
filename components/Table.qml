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
import Ubuntu.Components.ListItems 1.0 as ListItem

Item {
    id: root

    property var columnHeaders: []
    property var rowHeaders: []

    property int columnCount: columnHeaders.length
    property int rowCount: rowHeaders.length

    property var model: []

    property var delegate

    property int cellWidth: (root.width - headerWidth)/columnCount
    property int cellHeight: (root.height - headerHeight)/rowCount
    property int headerWidth: units.gu(4)
    property int headerHeight: units.gu(4)

    property color color: "white"
    property int radius: units.gu(2)

    property var modelCompleted: []

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            leftMargin: root.headerWidth
        }

        height: headerHeight * 3
        radius: root.radius
        antialiasing: true
    }

    Rectangle {
        anchors {
            left: parent.left
            bottom: parent.bottom
            top: parent.top
            topMargin: root.headerHeight
        }

        width: headerWidth * 3
        radius: root.radius
        antialiasing: true
    }

    Rectangle {
        anchors {
            left: parent.left
            bottom: parent.bottom
            top: parent.top
            right: parent.right
            topMargin: root.headerHeight
            leftMargin: root.headerWidth
        }

        radius: root.radius
        antialiasing: true
    }

    Repeater {
        model: columnCount
        delegate: Rectangle {
            anchors {
                top: parent.top
                bottom: parent.bottom
                topMargin: index === 0 ? root.headerHeight : 0
            }

            width: 1
            color: UbuntuColors.warmGrey
            x: (index) * cellWidth + headerWidth
        }
    }

    Column {
        anchors.fill: parent
        Row {
            anchors {
                left: parent.left
                leftMargin: root.headerWidth
            }

            Repeater {
                id: headerRepeater

                model: root.columnHeaders

                delegate: Label {
                    width: cellWidth
                    horizontalAlignment: Text.AlignHCenter
                    text: modelData
                    color: UbuntuColors.coolGrey
                    height: root.headerHeight
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        Repeater {
            model: root.rowCount

            delegate: Column {
                anchors {
                    left: parent.left
                    right: parent.right
                }

                property int row: index

                Rectangle {
                    anchors {
                        left: parent.left
                        right: parent.right
                        leftMargin: index === 0 ? root.headerWidth : 0
                    }

                    height: 1
                    color: UbuntuColors.warmGrey
                }

                Row {
                    Item {
                        width: root.headerWidth
                        height: root.cellHeight

                        Label {
                            text: rowHeaders[index]
                            anchors.centerIn: parent
                            color: UbuntuColors.coolGrey
                            rotation: -90
                        }
                    }

                    Repeater {
                        id: rowRepeater

                        model: columnCount

                        delegate: Item {
                            height: root.cellHeight
                            width: root.cellWidth

                            property bool done: false

                            MouseArea {
                                anchors.fill: parent
                                onClicked: done = !done
                            }

                            Label {
                                anchors.fill: parent

                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                text: root.model[row][index]
                                color: UbuntuColors.coolGrey

                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                                opacity: done ? 0.2 : 1

                                Behavior on opacity {
                                    UbuntuNumberAnimation {}
                                }
                            }

                            Rectangle {
                                anchors.centerIn: parent
                                rotation: -180/Math.PI * Math.atan(parent.height/parent.width)
                                width: Math.sqrt(parent.height * parent.height + parent.width * parent.width)
                                height: 1
                                color: UbuntuColors.warmGrey
                                antialiasing: true
                                smooth: true
                                opacity: done ? 1 : 0

                                Behavior on opacity {
                                    UbuntuNumberAnimation {}
                                }
                            }

//                            Rectangle {
//                                anchors.centerIn: parent
//                                rotation: 180/Math.PI * Math.atan(parent.height/parent.width)
//                                width: Math.sqrt(parent.height * parent.height + parent.width * parent.width)
//                                height: 1
//                                color: UbuntuColors.warmGrey
//                                antialiasing: true
//                                smooth: true
//                                visible: done
//                            }
                        }
                    }
                }
            }
        }
    }
}
