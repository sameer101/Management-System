import QtQuick 2.0
import QtGraphicalEffects 1.0
Item {
    id: topContent
    width: parent.width
    height: 50
    anchors{
        top: parent.top
        left: parent.left
        right: parent.right
    }
    Rectangle{
        id: topContentback
        width:parent.width
        height: parent.height
        color: "#FFF"
        radius: 9
    }
    Rectangle{
        id: topContentRoundedCorners
        anchors{
            bottom: topContentback.bottom
            left: topContentback.left
            right: topContentback.right
        }
        height: topContentback.radius
        width: topContentback.width
        color: topContentback.color
    }

}

