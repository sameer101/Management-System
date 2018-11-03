import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {
    property alias image: sideBarElementicon.source
    id: sideBarElement
    width:parent.width
    Layout.preferredHeight: 70
    Layout.alignment: Qt.AlignTop

    Rectangle{
       anchors.fill: parent
       color:"#FFF"
    }
    Image {
        id: sideBarElementicon
        source: "genericIcon.png"
    }
}
