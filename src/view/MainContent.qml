import QtQuick 2.0
import "."
import "components/."
Item {
    id: mainContent
    width: parent.width - 120
    height:parent.height - 150
    anchors{
        top: parent.top
        right: parent.right
        topMargin: 100
        bottom: parent.bottom
        bottomMargin: 10
        rightMargin: 5
    }
    //Products{}
    HorizontalList{}
}
