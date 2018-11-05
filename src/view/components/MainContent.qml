import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.1
import "."
Item {
    id: mainContent
    width: parent.width - 100
    height: parent.height - 40
    x: 85
    y: 20

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
            Cart{}
            Cart{}
            Cart{}
            Cart{}
            Cart{}
            Cart{}
            Cart{}
            Cart{}
            Cart{}
            Cart{}


        }
    }
}
