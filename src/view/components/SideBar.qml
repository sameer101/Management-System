import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.11

import "."
Item {
    id: sideBar
    width: 300
    height: parent.height - 70
    x: parent.width - 300
    y:  70

    function slide(){

          //sideBar.transform: translate {x = -20}
    }

    Rectangle{
        id: sideBarBack
        width: parent.width
        height: parent.height
        color: "#333"
    }
    GridLayout{
//        width: parent.width
//        height:  parent.height
        anchors.fill: parent
        id: gridLayout_control
        columns: 4

        Control{image: "a.png"}
        Control{image: "a.png"}
        Control{image: "a.png"}
        Control{image: "a.png"}
        Control{image: "a.png"}
        Control{image: "a.png"}
        Control{image: "a.png"}
        Control{image: "a.png"}
        Item { Layout.fillHeight: true }

    }

    layer.enabled: true
               layer.effect: DropShadow {
                   horizontalOffset: -1
                   verticalOffset: 0
                    samples: 4
                   spread: 0.0
                   color: "#000"
               }


}
