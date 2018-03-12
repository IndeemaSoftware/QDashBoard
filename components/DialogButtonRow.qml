/*
 * Ubuntu UI Extras - A collection of QML widgets not available
 *                    in the default Ubuntu UI Toolkit
 *
 * Copyright (C) 2014 Michael Spencer
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.0
import Ubuntu.Components 1.1


Item {
    width: parent.width
    height: childrenRect.height

    signal accepted
    signal rejected

    property alias acceptText: okButton.text
    property alias rejectText: cancelButton.text
    property alias acceptColor: okButton.color

    property alias enabled: okButton.enabled

    Button {
        id: cancelButton
        objectName: "cancelButton"
        text: i18n.tr("Cancel")

        anchors {
            left: parent.left
            right: parent.horizontalCenter
            rightMargin: units.gu(1)
        }

        onTriggered: {
            rejected()
        }
    }

    Button {
        id: okButton
        objectName: "okButton"

        anchors {
            left: parent.horizontalCenter
            right: parent.right
            leftMargin: units.gu(1)
        }

        text: i18n.tr("Ok")
        color: "#3fb24f"

        onTriggered: {
            print("TRIGGERED")
            accepted()
        }
    }
}
