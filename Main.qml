import QtQuick
import QtQuick.Controls
import "Utilities"

Window {
    id: applicationRootWindow
    minimumWidth: 300
    minimumHeight: 600
    visible: !isHelperVisible
    title: qsTr("Qt Calculator")
    property bool isHelperVisible: false

    Rectangle{
        id: backgroundRect
        anchors.top: parent.top
        width: parent.width
        height: parent.height*0.35
        color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
    }

    PrefsButton{
        id: showHelperButton

        anchors.top: backgroundRect.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: isHelperVisible ? "Hide Helper" : "Show Helper"
        enabled: !isHelperVisible
        onButtonClicked: {
            if(isHelperVisible){
                cBackendHelper.hide()
            }else{
                cBackendHelper.show()
            }
        }
    }

    Connections {
        target: cBackendHelper

        function onIsHelperVisibleChanged(flag){
            isHelperVisible = flag
            if(flag){
                showHelperButton.enabled = false
            }else{
                showHelperButton.enabled = true
            }
        }
    }
}
