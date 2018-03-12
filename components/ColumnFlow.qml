import QtQuick 2.0

/*
example usage:

Rectangle {
    width: 600
    height: 600

    ColumnFlow {
        id: grid
        anchors.fill: parent
        columns: 5
        model: 20

        delegate: Rectangle {
            id: item
            height: 100.0 * Math.random()
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), Math.random())
            Text {text: index}
        }
    }
}
*/
Item {
    id: columnFlow

    property int columns: 1
    property bool repeaterCompleted: false
    property alias model: repeater.model
    property alias delegate: repeater.delegate
    property int contentHeight: 0

    onColumnsChanged: reEvalColumns()
    onModelChanged: reEvalColumns()

    onWidthChanged: updateWidths()

    function updateWidths() {
        if (repeaterCompleted) {
            var count = 0

            //add the first <column> elements
            for (var i = 0; count < columns && i < columnFlow.children.length; i++) {
                //print(i, count)
                if (!columnFlow.children[i] || String(columnFlow.children[i]).indexOf("QQuickRepeater") == 0
                         || !columnFlow.children[i].visible) continue

                columnFlow.children[i].width = width / columns
                count++
            }
        }
    }

   function reEvalColumns() {
        if (columnFlow.repeaterCompleted === false)
            return

        if (columns === 0) {
            contentHeight = 0
            return
        }

        var i, j
        var columnHeights = new Array(columns);
        var lastItem = new Array(columns)
        var lastI = -1
        var count = 0

        //add the first <column> elements
        for (i = 0; count < columns && i < columnFlow.children.length; i++) {
            if (!columnFlow.children[i] || String(columnFlow.children[i]).indexOf("QQuickRepeater") == 0
                     || !columnFlow.children[i].visible) continue


            lastItem[count] = i
            columnHeights[count] = columnFlow.children[i].height

            columnFlow.children[i].anchors.top = columnFlow.top
            columnFlow.children[i].anchors.left = (lastI === -1 ? columnFlow.left : columnFlow.children[lastI].right)
            columnFlow.children[i].anchors.right = undefined
            columnFlow.children[i].width = columnFlow.width / columns

            lastI = i
            count++
        }

        //add the other elements
        for (i = i; i < columnFlow.children.length; i++) {
            var highestHeight = Number.MAX_VALUE
            var newColumn = 0

            if (!columnFlow.children[i] || String(columnFlow.children[i]).indexOf("QQuickRepeater") == 0
                     || !columnFlow.children[i].visible) continue

            // find the shortest column
            for (j = 0; j < columns; j++) {
                if (columnHeights[j] !== null && columnHeights[j] < highestHeight) {
                    newColumn = j
                    highestHeight = columnHeights[j]
                }
            }

            // add the element to the shortest column
            columnFlow.children[i].anchors.top = columnFlow.children[lastItem[newColumn]].bottom
            columnFlow.children[i].anchors.left = columnFlow.children[lastItem[newColumn]].left
            columnFlow.children[i].anchors.right = columnFlow.children[lastItem[newColumn]].right

            lastItem[newColumn] = i
            columnHeights[newColumn] += columnFlow.children[i].height
        }

        var cHeight = 0

        for (i = 0; i < columnHeights.length; i++) {
            if (columnHeights[i])
                cHeight = Math.max(cHeight, columnHeights[i])
        }

        contentHeight = cHeight

        updateWidths()
    }

    Repeater {
        id: repeater
        model: columnFlow.model

        Component.onCompleted: {
            columnFlow.repeaterCompleted = true
            columnFlow.reEvalColumns()
        }
    }
}
