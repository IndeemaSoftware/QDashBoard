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
import Ubuntu.Components.Popups 1.0
import Ubuntu.Components.ListItems 1.0 as ListItem

Dialog {
    id: root

    signal accepted
    signal rejected

    property alias value: textField.text
    property alias placeholderText: textField.placeholderText

    Component.onCompleted: {
        textField.forceActiveFocus()
        textField.cursorPosition = textField.text.length
    }

    property bool valid: true

    TextField {
        id: textField
        objectName: "inputField"

        onAccepted: if (valid) buttons.accepted()
        validator: RegExpValidator {
            regExp: /.+/
        }
    }

    DialogButtonRow {
        id: buttons

        enabled: textField.acceptableInput && valid

        onAccepted: {
            PopupUtils.close(root)
            root.accepted()
        }

        onRejected: {
            PopupUtils.close(root)
            root.rejected()
        }
    }
}
