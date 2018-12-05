import QtQuick 2.0
import "../../view/js/Settings.js" as SETTINGS

Item {
    id: topList

    property alias listModel: topListView.model

    anchors{
        top: parent.top
        left: parent.left
        right: parent.right
    }

    height: SETTINGS.TOP_LIST_HEIGHT
    ListView{
        id: topListView
        anchors.fill: parent
        clip: true
        spacing: 5
        orientation: ListView.Horizontal

    }
}
