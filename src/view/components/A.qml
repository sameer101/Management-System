import QtQuick 2.0
import QtQuick.Layouts 1.11
Item {
    id: navigation_item
    property alias content: content.text
    property alias color: content.color
    property alias navigation_item: navigation_item
    Layout.fillHeight: true
    Layout.topMargin:  35
    Layout.alignment: Qt.AlignCenter
	Rectangle{
		id: element_border
        width: content.width + 25
        height: content.height + 25
        border.color: "#fff"
        radius: 5
        color: Qt.rgba(0,0,0,0)
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 3
	    Text {
           anchors.verticalCenter: parent.verticalCenter
           anchors.horizontalCenter: parent.horizontalCenter
           id: content
           text: "empty"
           font.family: "ROBOTO"
           font.weight: Font.Bold
           font.pixelSize:  16
           color: "#FFF"
		}	
	}

}
