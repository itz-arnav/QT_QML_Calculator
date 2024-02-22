import QtQuick
import QtQuick.Controls

import "Utilities"
import "Utilities/FontAwesome.js" as FontAwesome

Rectangle {
    id: helperRoot
    width: cBackendHelper.helperWidth
    height: cBackendHelper.helperHeight

    border.color: "#fff"
    border.width: 1

    SystemPalette { id: systemPalette; colorGroup: SystemPalette.Active }

    Column {
        anchors.fill: parent
        anchors.margins: 1
        spacing: 10

        Rectangle {
            id: backgroundRect
            width: parent.width
            height: parent.height * 0.45
            color: "blue"

            IconButton{
                anchors.top: parent.top
                anchors.right: parent.right
                background.opacity: 0
                iconText: FontAwesome.tool.close
                iconColor: systemPalette.windowText
                tooltipText:qsTr("Close")
                onClicked: {
                    cBackendHelper.hide()
                }
            }
        }

        PrefsSpaceDelegate {
        }

        Button {
            id: changeColourButton
            anchors.horizontalCenter: parent.horizontalCenter
            topPadding: 10
            bottomPadding: 10
            leftPadding: 30
            rightPadding: 30
            text: "Change Colour"
            onClicked: {
                backgroundRect.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
            }
        }

        PrefsSpaceDelegate {
        }

        Label{
            text: FontAwesome.x
        }

    }



}
