import QtQuick
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Rectangle {
    id: buttonRectangle
    width: 130
    height: 45
    radius: 2

    property string text: "Click Me"
    property string buttonColor: "#26a641"
    property string shadowColor: Qt.darker(buttonColor, 1.2)
    property string deeperColor: "#006d32"
    signal buttonClicked()

    Component.onCompleted: {
        buttonRectangle.color = buttonColor
    }

    Label {
        anchors.fill: parent
        text: buttonRectangle.text
        font.pointSize: 10
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#fff"
        font.bold: true
    }

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        color: buttonRectangle.shadowColor
        samples: 10
        // horizontalOffset: 3
        // verticalOffset: 3
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            buttonRectangle.buttonClicked()
        }
        onDoubleClicked: {
        
        }

        cursorShape: Qt.PointingHandCursor

        hoverEnabled: true
        onEntered: {
            colorAnimation.to = shadowColor
            colorAnimation.start()
        }

        onExited: {
            colorAnimation.to = buttonColor
            colorAnimation.start()
        }
    }

    ColorAnimation {
        id: colorAnimation
        target: buttonRectangle
        property: "color"
        duration: 300
        easing.type: Easing.InOutQuad
    }
}
