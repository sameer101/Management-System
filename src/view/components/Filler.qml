import QtQuick 2.0
import QtQuick.Layouts 1.11
Item {
    property string fillDirection: "V"
    Layout.fillHeight: true
    Layout.fillWidth: true
    Rectangle{
        id: filler_back
        width: (fillDirection == "H") ? parent.width : 10
        height: (fillDirection == "V") ? parent.height : 10
        color: "#FFF"
    }

}
