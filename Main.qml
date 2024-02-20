import QtQuick
import QtQuick.Controls

Window {
    id: applicationRootWindow
    minimumWidth: 200
    minimumHeight: 400
    visible: true
    title: qsTr("Helper Window Display")


    Button{
        anchors.centerIn: parent
        padding: 20
        text: "Show Helper"

        onClicked: {
            text = cBackendHelper.show()
        }
    }


}
