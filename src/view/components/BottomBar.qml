import QtQuick 2.0
import QtGraphicalEffects 1.0
Item {
    id: bottomBar
    width: parent.width
    height: 30
    anchors{
        bottom: parent.bottom
        left: parent.left
        right: parent.right
    }
    Rectangle{
        id: bottomBarback
        width:parent.width
        height: parent.height
        color: "#AAA"
        radius: 9
    }
    Rectangle{
        id: topContentRoundedCorners
        anchors{
            top: bottomBarback.top
            left: bottomBarback.left
            right: bottomBarback.right
        }
        height: bottomBarback.radius
        width: bottomBarback.width
        color: bottomBarback.color
    }

}

