import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import "."
Item {
    id: sideTabBar
    width: 70
    height: parent.height
    property string activeElement: ""
    property int currentIndex: -1
    Rectangle{
        color: "#a809c4"
        anchors.fill: parent
    }

    ListModel{
        id: elements
        ListElement {
            image: "../assets/product.svg"
        }
        ListElement {
            image: "../assets/product.svg"
        }
        ListElement {
            image: "../assets/product.svg"
        }
    }

    ColumnLayout{
        id:sidebarLayout
        anchors.fill: parent
        spacing:2

        Repeater{
            model: elements
            SideBarElement{
                id: element
                highlight: ix == currentIndex
                icon: image
                property int ix: index
                MouseArea{
                    anchors.fill: parent
                    onClicked: currentIndex = ix
                }
            }
        }
        Item {Layout.fillHeight: true}
    }

    layer.enabled: true
               layer.effect: DropShadow {
                   horizontalOffset: 1
                   verticalOffset: 0
                   samples: 2
                   spread: 0.1
                   color: Qt.rgba(0,0,0,0.3)
               }
}
