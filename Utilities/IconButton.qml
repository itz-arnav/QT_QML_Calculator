import QtQuick
import QtQuick.Controls

ToolButton {
    id: control
    property bool themed: true
    property bool showThemeRect: false
    property string iconText: ""
    property string iconColor: ""
    property int iconSize: 18
    property bool showPlainText: false
    property bool flatButton: parent.flatbuttons ? true : false
    property bool showOnLocked: false
    property bool oldIcon: false
    property alias toolText: toolLabel
    property string tooltipText: ""
    property alias tooltipLable: tooltip
    property string backgroundColor: "#33333333"
    signal closeClicked()

    implicitHeight: 40
    implicitWidth: 40

    hoverEnabled: tooltipText
    opacity: control.pressed || !control.enabled ? 0.7 : 1.0

    Accessible.name: tooltipText
    Accessible.role: Accessible.Button
    Keys.onEnterPressed:{
        control.clicked()
    }
    Keys.onReturnPressed:control.clicked()
    Accessible.onPressAction: control.clicked()

    Image {
        id: toolImage
        anchors.centerIn: parent
        sourceSize.width: iconSize
        sourceSize.height: iconSize
        source: iconText + iconColor
        visible: !showPlainText
        opacity: 1
    }

    Label{
        id: toolLabel
        visible: showPlainText
        text: showPlainText ? iconText : ""
        font.bold: true
        opacity: control.enabled ? 0.75 : 0.3
        anchors.centerIn: parent
        renderType: Text.QtRendering
        elide: Text.ElideRight
        background: Rectangle{
            border.color: toolLabel.color
            border.width: control.activeFocus ? 2 : 1
            width: toolLabel.implicitWidth + 18
            height: 24
            anchors.centerIn: parent
            color: "transparent"
            radius: 4
        }
    }

    ToolTip {
        id:tooltip
        text: tooltipText
        visible: hovered
        timeout:2000
        delay: 500
    }

    flat: true

    onHoveredChanged: {
        if(tooltip.visible)
            tooltip.hide()
        showThemeRect = control.hovered
    }


    Rectangle {
        id: themeRect
        implicitWidth: showPlainText ? toolLabel.paintedWidth + 16 : 54
        implicitHeight: 44
        anchors.horizontalCenter: parent.horizontalCenter
        color: Qt.darker(backgroundColor, control.enabled && (control.checked || control.hovered) ? 1.5 : 1.0)
        opacity: enabled ? 1 : 0.3
        visible: control.down || (control.enabled && (control.checked || control.showThemeRect))
    }

    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            if(tooltip.visible)
                tooltip.hide()
            showThemeRect = false
            closeClicked()
        }
    }
}
