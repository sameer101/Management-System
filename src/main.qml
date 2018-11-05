import QtQuick 2.11
import QtQuick.Window 2.11
import QtGraphicalEffects 1.0
import "./view/components/."

Window {
    id:main
    visible: true
    width: 1000
    height: 680
    color: Qt.rgba(0,0,0,0)
    x: 80
    y: 40

    flags  : Qt.FramelessWindowHint  |  Qt.Window
    Rectangle {
      id: rect
      width: parent.width - 10
      height: parent.height - 10
      x: 5
      y: 5
      color: "#EEE"
      SideTabBar{}
      MainContent{}
    }


    DropShadow {
        anchors.fill: rect
        horizontalOffset: 0
        verticalOffset: 2
        radius: 5
        samples: 7
        spread: 0
        source: rect
        color: "black"
      }

}
