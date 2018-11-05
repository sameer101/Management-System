import QtQuick 2.11
import QtQuick.Window 2.11
import "./view/components/."

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Management System")
    color: "#eee"
    SideTabBar{}
    MainContent{}
}
