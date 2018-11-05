import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {
    property alias icon: sideBarElementicon.source
    property int elementId: -1
    property bool highlight: false
    id: sideBarElement
    width:parent.width
    Layout.preferredHeight: 70
    Layout.alignment: Qt.AlignTop

    Rectangle{
       anchors.fill: parent
       color: highlight ? Qt.rgba(1,1,0,1) : Qt.rgba(0,0,0,0)


    }
    Image {
        id: sideBarElementicon
        source: "genericIcon.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: 50
        height: 50
    }
}
