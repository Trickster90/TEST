import QtQuick 2.0
import QtQuick 2.7
import QtQuick.Controls 2.1
import "qrc:/../FusionComponent"
import QtQuick.Controls.Material 2.1



Page {

    header: ToolBar{
        height: Utils.dp(60)
    }


    ListView{
        anchors.fill: parent
        spacing: 10
        model: 30

        delegate: Rectangle {
            width: parent.width
            height: Utils.dp(40)
            color: "gray"
        }
    }


}
