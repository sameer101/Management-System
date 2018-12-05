import QtQuick 2.0
import QtQuick.Layouts 1.3
Item {
    id: controlBarElement
    property alias icon: controlBarElementIcon.source
    width:20
    height: 20
    Layout.leftMargin: 5
    Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
    Rectangle{
        id: controlBarElementBack
        anchors.fill: parent
        radius: parent.width
        color: "#EEE"
        border{
            width: 1
            color: "#DDD"
        }
    }

    Image {
        width: 0.5 * controlBarElementBack.width
        height: 0.5 * controlBarElementBack.height
        anchors{
            verticalCenter: controlBarElementBack.verticalCenter
            horizontalCenter: controlBarElementBack.horizontalCenter
        }

        id: controlBarElementIcon
        source: "file"
    }

}
