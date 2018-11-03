import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.11

import "."

Item {
    id: navigation
    width: parent.width
    height: 70
    signal menuIconclicked()

    Loader{
        id: sideBarLoader
        source: "SideBar.qml"
    }

    Rectangle{
        id: navigation_back
        width: parent.width
        height: parent.height
		    LinearGradient {
				anchors.fill: parent
				start: Qt.point(0, 0)
				end: Qt.point(parent.width, 0)
                gradient: Gradient {
                GradientStop { position: 0.0; color:  "#db3402" }
                GradientStop { position: 1; color: "#c91243" }
        }
        }

		RowLayout {
			id: navigation_row_layout
            width: parent.width - 150
			height: parent.height / 4
            spacing: 1

            A{content: "Header 1"}
            A{content: "Header 2"}
            A{content: "Header 3"}
            A{content: "Header 4"}
            A{content: "Header 5"}


		}

        Rectangle{
                id: menuIcon
                width: 40
                height: 40
                x: parent.width - 70
                y : 15
                color: "#FFF"

                MouseArea {
                    anchors.fill: parent
                    onClicked: sideBarLoader.item.slide()
                }
            }

    }

    layer.enabled: true
               layer.effect: DropShadow {
                   horizontalOffset: 0
                   verticalOffset: 2
                   samples:20
                   spread: 0.0
                   color: "#000"
               }


}
