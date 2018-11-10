import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls 1.1
import "."
Item {
    id: mainContent
    width: parent.width - 280
    height:parent.height - 100
    anchors{
        top: parent.top
        right: parent.right
        topMargin: 100
        bottom: parent.bottom
        bottomMargin: 10
        rightMargin: 5

    }
    ScrollView {
        id:scrollView
        height: parent.height
        width: mainContent.width

        GridLayout{
            id: mainContentLayout
            width: mainContent.width - 30
            columnSpacing: 20
            rowSpacing: 20
            columns: 4

            Cart{}
            Cart{}
            Cart{}
            Cart{}

            Cart{}
            Cart{}
            Cart{}
            Cart{}
            Cart{}Cart{}

            Cart{}
        }
    }
}
