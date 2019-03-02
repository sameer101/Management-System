import QtQuick 2.0

import "components/."
import "js/Settings.js" as SETTINGS

Item {
    id: horizontalList
    width: parent.width
    height: parent.height

    Item {
        id: horizontalListTopBar
        width: parent.width
        height: 40
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }

        Row{
            id:  horizontalListTopBarRow
            anchors.fill: parent

            Text {
                id: heading
                text: qsTr("Devices")
                color: SETTINGS.FONT_HEADER_LARGE_COLOR
                font.family: SETTINGS.FONT_HEADER_LARGE
                font.pixelSize: SETTINGS.FONT_HEADER_LARGE_SIZE
            }
        }
    }
    Flickable
    {
        anchors{
           bottom: parent.bottom
           left: parent.left
           right: parent.right
           top: horizontalListTopBar.bottom
//           topMargin: 5

        }
        contentHeight: parent.height
        contentWidth: parent.width
        clip: true
        ListView{
            id: listView
            anchors.fill: parent
            delegate:  Component { HorizontalListItem{ mac: "entryText"} }
            model:listmodel

        }
    }
    ListModel{
        id: listmodel

        ListElement {
                    entryText: "Bla bla 2"
                }
        ListElement {
                    entryText: "Bla bla 3"
                }
        ListElement {
                    entryText: "Bla bla 4"
                }
        ListElement {
                    entryText: "Bla bla 4"
                }
        ListElement {
                    entryText: "Bla bla 4"
                }
        ListElement {
                    entryText: "Bla bla 4"
                }
        ListElement {
                    entryText: "Bla bla 4"
                }
        ListElement {
                    entryText: "Bla bla 4"
                }

        ListElement {
                    entryText: "Bla bla 4"
                }
        ListElement {
                    entryText: "Bla bla 4"
                }
        ListElement {
                    entryText: "Bla bla 4"
                }
        ListElement {
                    entryText: "Bla bla 4"
                }
    }
}
