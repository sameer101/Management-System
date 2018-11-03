import QtQuick 2.0
import QtQuick.Layouts 1.3
import "."
Item {
    width: 70
    height: parent.height

    Rectangle{
        color: "#a809c4"
        anchors.fill: parent
    }
    ColumnLayout{
        anchors.fill: parent
        spacing:2
        SideBarElement{}
        SideBarElement{}
        SideBarElement{}
        SideBarElement{}
        Item { Layout.fillHeight: true }
    }


}
