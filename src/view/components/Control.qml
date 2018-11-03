import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.11
Item {
    id:control
    property alias image: control_image.source
    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.rowSpan: 1

    Rectangle {
        id: control_back
        width: parent.width
        height: parent.width
        color: Qt.rgba(0,0,0,0)
        border.color: "#111"
        radius: 10

        RadialGradient {
            anchors.fill: parent
            gradient: Gradient {
            GradientStop { position: 0.0; color:  "#333" }
            GradientStop { position: 1; color: "#222" }
            }
         }
    }
    Image {
        id: control_image
        source: ""
        width: control_back.width
        height: control_back.height
        anchors.verticalCenter: control_back.verticalCenter
        anchors.horizontalCenter: control_back.horizontalCenter
    }


}
