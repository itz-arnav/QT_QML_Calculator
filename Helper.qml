import QtQuick
import QtQuick.Controls

import "Utilities"

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
        }

        PrefsSpaceDelegate {
        }

        Button {
            id: closeHelperButton
            anchors.horizontalCenter: parent.horizontalCenter
            topPadding: 10
            bottomPadding: 10
            leftPadding: 30
            rightPadding: 30
            text: "Close"
            onClicked: cBackendHelper.hide()
        }
    }
}
