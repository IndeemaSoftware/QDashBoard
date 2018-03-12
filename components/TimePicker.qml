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

UbuntuShape {
    color: Qt.rgba(0.5,0.5,0.5,0.4)

    width: units.gu(20)
    height: units.gu(18)

    Item {
        id: rectangle
        //color: Qt.rgba(0.2,0.2,0.2,0.2)

        anchors {
            fill: parent
            //left: parent.left
            //right: parent.right
            //top: header.bottom
        }

        Spinner {
            anchors {
                left: parent.left
                right: parent.horizontalCenter
                top: parent.top
                bottom: parent.bottom
            }

            minValue: 1
            value: 3
            maxValue: 12
        }
        VerticalDivider {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 1
        }

        Spinner {
            anchors {
                left: parent.horizontalCenter
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }

            minValue: 0
            maxValue: 59
        }
    }
}
