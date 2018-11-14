import QtQuick 2.0
import QtQuick.Layouts 1.3
Item {
    id: controlsBar
    anchors{
        right: parent.right
        verticalCenter: parent.verticalCenter
        rightMargin: 5
    }
    width: 70
    height: 20

    RowLayout{
        id: controlsBarLayout
        spacing: 2

        ControlBarElement{
            icon: "../assets/ICON_Resize.png"
            MouseArea{
                anchors.fill: parent
                onClicked: color = "#555"
            }
        }
        ControlBarElement{
            icon: "../assets/ICON_Close.png"
            MouseArea{
                anchors.fill: parent
                onFocusChanged: color = "#555"
                onClicked: {

                    Qt.quit()
                }
            }
        }
    }
}
