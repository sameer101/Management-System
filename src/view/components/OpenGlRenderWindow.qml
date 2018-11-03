import QtQuick 2.0
import QtGraphicalEffects 1.0

import "."
Item {
    id: openGlRenderWindow
    width: parent.width - 330
    height: parent.height - 100
    x: 15
    y:  85

    Rectangle{
        id: openGlRenderWindowBack
        width: parent.width
        height: parent.height
        color: "#333"
    }

    layer.enabled: true
               layer.effect: DropShadow {
                   horizontalOffset: 0
                   verticalOffset: 0
                    samples: 3
                   spread: 0.0
                   color: "#000"
               }


}
