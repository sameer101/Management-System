import QtQuick 2.0
import QtQuick.Layouts 1.3

import "../js/Settings.js" as SETTINGS

Item {
    property alias icon: icon_font.text
    property alias iconReference: icon_reference.text
    property int elementId: -1
    property bool highlight: false
    id: sideBarElement
    width: parent.width
    height: 10
    Layout.preferredHeight: 70
    Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
    Rectangle{
        id: elemenBack
        anchors.fill: parent
        color: highlight ? "#3C11A5" : Qt.rgba(0,0,0,0)

    }
    Text {
        id: icon_font
        font.family: SETTINGS.FONT_MATERIAL_DESIGN
        font.pixelSize: 32
        color: SETTINGS.ICON_DEFAULT_COLOR
        text: icon
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: elemenBack.top
        anchors.topMargin: 0.1 * elemenBack.width

    }
    Text {
        id: icon_reference
        text: ""
        font.family: SETTINGS.FONT_HEADER_MEDUIM
        font.pixelSize: SETTINGS.FONT_HEADER_MEDUIM_SIZE
        anchors{
            top: icon_font.bottom
            topMargin: 5
            horizontalCenter: parent.horizontalCenter
        }
        color: SETTINGS.ICON_DEFAULT_COLOR
    }
}
