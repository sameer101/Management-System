import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import "../js/Material-icons.js" as MD

import "."
Item {
    id: sideTabBar
    anchors{
        left: parent.left
        top: parent.top
        bottom: parent.bottom
        topMargin: 40
        bottomMargin: 0
    }
    width: 70
    property string activeElement: ""
    property int currentIndex: -1
    Rectangle{
        id: sideTabBarBack
        color: "#7264A7"
        anchors.fill: parent

    }
    ListModel{
        id: elements
        ListElement {iconName: "shopping_basket"; iconText: "Products"}
    }

    ColumnLayout{
        id:sidebarLayout
        anchors.fill: parent
        anchors.topMargin: 150
        spacing:4

        Repeater{
            model: elements
            SideBarElement{
                id: element
                property int ix: index
                highlight: ix == currentIndex
                icon: iconName
                iconReference: iconText
                MouseArea{
                    anchors.fill: parent
                    onClicked: currentIndex = ix
                }
            }
        }
        Item {Layout.fillHeight: true}
    }

}
