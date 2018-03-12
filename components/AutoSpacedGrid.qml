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

Item {
    id: root


    property int cellWidth
    property int cellHeight

    property int xCount
    property int yCount: {
        var count = cellCount/xCount
        if (cellCount % xCount > 0)
            count++
        return count
    }

    height: yCount * cellHeight + (yCount) * ySpacing

    property int cellCount

    Component.onCompleted: layout()

    onWidthChanged: layout()

    // FIXME: A really uggly hack to get the layout right
    Timer {
        interval: 1
        running: true
        onTriggered: layout()
    }

    function layout() {
        var count = 1
        var space = calcSpacing(count)
        while (space >= minSpacing) {
            count++
            space = calcSpacing(count)
        }

        count--
        spacing = calcSpacing(count)
        if (root.cellCount <= count) {
            spacing = minSpacing
        }

        xCount = count
        //print("Spacing is", spacing, xCount)
    }

    function calcSpacing(count) {
        var spacing = (width - count * cellWidth)/(count)
        //print("Spacing for count", count, "is", spacing/8, "gu")
        return spacing
    }

    property real spacing
    property int minSpacing: units.gu(2)
    property real outerSpacing: 1/2 * spacing
    property real outerYSpacing: 1/2 * ySpacing
    property real ySpacing: spacing

    default property alias children: grid.children

    Grid {
        id: grid
        anchors {
            fill: parent
            leftMargin: root.outerSpacing
            rightMargin: root.outerSpacing
            topMargin: root.outerYSpacing
            bottomMargin: root.outerYSpacing
        }

        columns: xCount

        columnSpacing: root.spacing
        rowSpacing: root.ySpacing
    }
}
