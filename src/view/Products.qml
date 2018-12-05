import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls 1.1
import QtGraphicalEffects 1.0

import "js/Settings.js" as SETTINGS
import "components/."

Item {
    id: products
    anchors.fill:parent
    anchors.rightMargin: 100


    Item {
        id: productsTopBar
        width: parent.width
        height: 40
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }

        Row{
            id: productsTopBarRow
            anchors.fill: parent

            Text {
                id: heading
                text: qsTr("Products")
                color: SETTINGS.FONT_HEADER_LARGE_COLOR
                font.family: SETTINGS.FONT_HEADER_LARGE
                font.pixelSize: SETTINGS.FONT_HEADER_LARGE_SIZE
            }
        }
    }

    ListModel{
        id:topListModel
    ListElement {src : "imageUrl"}

    }



    Flickable
    {
        anchors{
            top: productsTopBar.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            topMargin: 200
        }
        Component.onCompleted: {
            flow.height = (childrenRect.height % 4 > 0) ? ((childrenRect.height / 4) + 150) : (childrenRect.height / 4);
        }
        contentHeight: flow.height
        clip: true

        Flow
        {
            id: flow
            width: (SETTINGS.CART_WIDTH * 4) + 45
            anchors{
                horizontalCenter: parent.horizontalCenter
            }

            spacing: 15

            flow: Flow.TopToBottom
            Repeater
            {
                model: topListModel
                Cart
                {
                    image: src
                }
            }
        }

    }
    Rectangle{
        anchors{
            top: productsTopBar.bottom
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            topMargin: 200
        }
        width: flow.width + 4
        gradient:  Gradient{
            GradientStop{position: 0; color: Qt.rgba(0.8, 0.8, 0.8, 1)}
            GradientStop{position: 0.02; color: Qt.rgba(255,255,255,0)}
            GradientStop{position: 0.985; color: Qt.rgba(255,255,255,0)}
            GradientStop{position: 1; color: Qt.rgba(0.8, 0.8, 0.8, 1)}
        }
//        InnerShadow{
//            anchors.fill: parent
//            radius: 0.8
//            samples: 13
//            horizontalOffset: 0
//            verticalOffset: 3
//            spread: 6
//            color: "#333"
//            source: parent
//        }
    }

}
