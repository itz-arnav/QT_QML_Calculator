import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "Utilities"
Window {
    id: applicationRootWindow
    minimumWidth: 300
    minimumHeight: 400
    visible: !isHelperVisible
    title: qsTr("Helper Window Settings")
    property bool isHelperVisible: false

    Rectangle{
        id: backgroundRect
        anchors.top: parent.top
        width: parent.width
        height: parent.height*0.45
        color: "blue"
    }

    Button {
        id: showHelperButton
        text: isHelperVisible ? "Hide Helper" : "Show Helper"
        anchors.top: backgroundRect.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            if(isHelperVisible){
                cBackendHelper.hide()
            }else{
                cBackendHelper.show()
            }
        }
    }

    PrefsButton{
        anchors.top: showHelperButton.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Connections {
        target: cBackendHelper

        function onIsHelperVisibleChanged(flag){
            isHelperVisible = flag
        }
    }
}
