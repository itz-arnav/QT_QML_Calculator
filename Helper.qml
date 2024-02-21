import QtQuick
import QtQuick.Controls

Rectangle{
    id: helperRoot
    width: 300
    height: 400

    Rectangle{
        id: backgroundRect
        width: helperRoot.width
        height: 120
        color: "blue"
        anchors.top: parent.top
    }

    Button {
        anchors.top: backgroundRect.bottom
        anchors.horizontalCenter: helperRoot.horizontalCenter
        topPadding: 10
        bottomPadding: 10
        leftPadding: 30
        rightPadding: 30
        text: "Close"

        onClicked: cBackendHelper.hide()
    }

}
