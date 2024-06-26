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
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)

            IconButton{
                anchors.top: parent.top
                anchors.right: parent.right
                background.opacity: 0
                iconText: FontAwesome.tool.close
                iconColor: systemPalette.windowText
                tooltipText:qsTr("Close")
                onCloseClicked: {
                    cBackendHelper.hide()
                }
            }
        }

        PrefsSpaceDelegate {
        }

        PrefsButton{
            id: changeColourButton

            anchors.horizontalCenter: parent.horizontalCenter
            text: "Change Colour"

            onButtonClicked: {
                backgroundRect.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
            }
        }

        PrefsSpaceDelegate {
        }

    }



}
