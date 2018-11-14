import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
Item {
    id: cart
    Layout.preferredHeight: 300
    Layout.preferredWidth: 100
    Layout.fillWidth: true

    Rectangle{
        anchors.fill: parent
        color: "#FFF"
        radius: 5
    }
    layer.enabled: true
               layer.effect: DropShadow {
                   horizontalOffset: 0
                   verticalOffset: 0
                    samples: 2
                   spread: 0.1
                   color: Qt.rgba(0,0,0,0.3)
               }
}
