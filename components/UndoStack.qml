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

Object {
    /*
     * Format for property changes is:
     *     {message, type:"property", obj, prop, oldValue, newValue}
     * Format for actions is:
     *     {message, type:"action", func, undoFunc, args}
     */
    property var stack: []

    function setProperty(message, obj, prop, value, oldValue) {
        if (oldValue === undefined)
            oldValue = obj[prop]
        obj[prop] = value
        stack.push({
                       message: message,
                       type: "property",
                       obj: obj,
                       prop: prop,
                       oldValue: oldValue,
                       newValue: value
                   })
    }

    function doAction(message, func, undoFunc, args) {

    }
}
