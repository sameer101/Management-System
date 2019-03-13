import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

import "../js/Settings.js" as SETTINGS



Item {
    id: item1
    property alias mac: macAddress.text
    property alias ip: ipAddress.text
    property alias brand: deviceBrand.text
    width: parent.width
    height: SETTINGS.HORIZONTAL_LIST_ITEM_HEIGHT

    Rectangle{
        id: background
        anchors{
            margins: 5
            fill: parent

        }
        radius: SETTINGS.HORIZONTAL_LIST_ITEM_RADIUS
        color: SETTINGS.HORIZONTAL_LIST_ITEM_COLOR
    }

    RowLayout{
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: background.right
        anchors.left: background.left
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        spacing: 1.8

        Text {
            id: ipAddress
            font.family: SETTINGS.FONT_MATERIAL_ROBOTO_LIGHT
            font.pixelSize: SETTINGS.HORIZONTAL_LIST_ITEM_FONT_SIZE
            text: qsTr("text")
        }

        Text {
            id: macAddress
            text: qsTr("text")
            font.family: SETTINGS.FONT_MATERIAL_ROBOTO_LIGHT
            font.pixelSize: SETTINGS.HORIZONTAL_LIST_ITEM_FONT_SIZE
        }

        Text {
            id: deviceBrand
            text: qsTr("text")
            font.family: SETTINGS.FONT_MATERIAL_ROBOTO_LIGHT
            font.pixelSize: SETTINGS.HORIZONTAL_LIST_ITEM_FONT_SIZE
        }
    }


    layer.enabled: true
    layer.effect: DropShadow {
       horizontalOffset: 0
       verticalOffset: 1
       samples: 2
       spread: 0.1
       color: Qt.rgba(0,0,0,0.1)
    }
}
