
import QtQuick 2.7
import QtQuick.Controls 2.1
//import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.0
import "qrc:/../FusionComponent"



ApplicationWindow {
    visible: true
    width: Utils.width
    height: Utils.height
    title: qsTr("Hello World")

    onWidthChanged: {
        Utils.width = width
    }

    onHeightChanged: {
        Utils.height = height
    }


    ListTableTest{
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }


//    MaterialDesignTest{
//        anchors.fill: parent
//    }



}  //ApplicationWindow
