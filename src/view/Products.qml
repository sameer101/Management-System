import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls 1.1
import "js/Settings.js" as SETTINGS
import "components/."

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
            anchors.fill: parent

            Text {
                id: heading
                text: qsTr("Products")
                color: SETTINGS.FONT_HEADER_LARGE_COLOR
                font.family: SETTINGS.FONT_HEADER_LARGE
                font.pixelSize: SETTINGS.FONT_HEADER_LARGE_SIZE
            }
        }
    }

    ScrollView {
        id:scrollView
        anchors{
            top: productsTopBar.bottom
            left: productsTopBar.left
            right: productsTopBar.right
            topMargin: 10
        }

        width: productsTopBar.width

        GridLayout{
            id: mainContentLayout
            width: productsTopBar.width - 30
            columnSpacing: 20
            rowSpacing: 20
            columns: 4

            Cart{}
            Cart{}
            Cart{}
            Cart{}
            Cart{}
            Cart{}
        }
    }
}
