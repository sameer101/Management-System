import QtQuick 2.0
import "js/Settings.js" as SETTINGS

Item {
    id: products
    anchors.fill:parent

    Item {
        id: productsTopBar
        width: parent.width
        height: 100
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }

        Row{
            id: productsTopBarRow
            Text {
                id: heading
                anchors{
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }

                text: qsTr("Products")
                font.family: SETTINGS.FONT_HEADER_LARGE
                font.pixelSize: SETTINGS.FONT_HEADER_LARGE_SIZE
            }
        }
    }
}
