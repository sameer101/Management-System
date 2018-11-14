import QtQuick 2.0
import QtGraphicalEffects 1.0
Item {
    id: topContent
    width: parent.width
    height: 40
    anchors{
        top: parent.top
        right: parent.right
    }
    Rectangle{
        id: topContentback
        width:parent.width
        height: parent.height
        color: "#FFF"
    }
    ControlsBar{}
    layer.enabled: true
               layer.effect: DropShadow {
                   horizontalOffset: 0
                   verticalOffset: 1
                   samples: 1
                   spread: 0
                   color: Qt.rgba(0,0,0,0.1)
               }

}

