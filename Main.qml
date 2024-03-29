import QtQuick
import QtQuick.Controls

Window {
    id: applicationRootWindow
    minimumWidth: 300
    minimumHeight: 400
    visible: !isHelperVisible
    title: qsTr("Helper Window Settings")
    property bool isHelperVisible: false

    Button{
        id: showHelperButton
        anchors.centerIn: parent
        topPadding: 10
        bottomPadding: 10
        leftPadding: 30
        rightPadding: 30
        text: isHelperVisible ? "Hide Helper" : "Show Helper"

        onClicked: {
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
        }
    }
}
