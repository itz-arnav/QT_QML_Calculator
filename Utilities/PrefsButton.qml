import QtQuick
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Rectangle {
    id: buttonRectangle
    width: 100
    height: 40
    color: "#0ACF97"
    radius: 3

    property string text: "Click Me"
    signal buttonClicked()

    Label {
        anchors.fill: parent
        text: buttonRectangle.text
        font.pointSize: 12
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#fff"
        font.bold: true
    }

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        color: Qt.darker(buttonRectangle.color, 1.4)
        samples: 20
        // horizontalOffset: 3
        // verticalOffset: 3
    }

    MouseArea {
        anchors.fill: parent
        onClicked: buttonClicked()
        cursorShape: Qt.PointingHandCursor
    }
}
