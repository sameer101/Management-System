import QtQuick 2.0

Item {
    id: topContent
    anchors{
        left: parent.Left
        right: parent.right
        top: parent.top
    }
    height: 100
    width: parent.width
    Rectangle{
        id: topContentback
        anchors.fill: parent
        color: "#555"
    }



}
