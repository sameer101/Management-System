import QtQuick 2.0
import QtGraphicalEffects 1.0

import QtQuick.Layouts 1.3

import "../js/Settings.js" as SETTINGS
Item {
    id: cart
    property alias image: cartImage.source
   // property alias text: cartText.text
    property bool hovered: false
    property int originalHeight;
    property int originalWidth;
    property int scaledWidth;
    property int scaledHeight;
    property int columnsNumber: 1
    property int shadowOffset: 0;

    width: SETTINGS.CART_WIDTH
    height: SETTINGS.CART_HEIGHT


    // Items' states
    states:[
        State { name: SETTINGS.MOUSE_HOVER
            PropertyChanges { target: blurLayer; opacity: 0.3 }
        },
        State { name: SETTINGS.MOUSE_OUT
            PropertyChanges { target: blurLayer; opacity: 0 }
        }
    ]

    // Items' animations.
    transitions: [
          Transition {
            from: SETTINGS.MOUSE_OUT
            to: SETTINGS.MOUSE_HOVER
            reversible: true
            PropertyAnimation {property: "opacity"; duration: 300}
        }
    ]

    Image {
        id: cartImage
        source: "file"

        Component.onCompleted: {
           originalHeight = sourceSize.height
           originalWidth = sourceSize.width
           scaledHeight = originalHeight / (originalWidth / SETTINGS.CART_WIDTH)
           cart.height =  scaledHeight
        }

       width: SETTINGS.CART_WIDTH
       height: scaledHeight

       visible: false
    }

    // Graphical effects.
    MouseArea{
        id: mousearea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onEntered:{
            cart.state = SETTINGS.MOUSE_HOVER
        }
        onExited:{
            cart.state = SETTINGS.MOUSE_OUT
        }

    }

    layer.enabled: true
    layer.effect: DropShadow {
       horizontalOffset: 0
       verticalOffset: shadowOffset
       samples: 6
       spread: 0.2
       color: Qt.rgba(0,0,0,0.7)
    }


    Rectangle{
        id: maskSource
        width: cartImage.width
        height: cartImage.height
        visible: false
        radius: SETTINGS.CART_ROUNDED_CORNERS
    }



    OpacityMask{
        id: opacityMask
        anchors.fill: cartImage
        source: cartImage
        maskSource: maskSource
    }

    Item {
        id: cartForeground
        anchors.fill: maskSource
        Rectangle{
            id: blurLayer
            anchors.fill: cartForeground
            color: "#000"
            radius: SETTINGS.CART_ROUNDED_CORNERS
            state: SETTINGS.MOUSE_OUT
            opacity:SETTINGS.ITEM_OPACITY
        }



    }
}

