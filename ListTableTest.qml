import QtQuick 2.7
import QtQuick.Controls 2.1
import "qrc:/../FusionComponent"
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0


Item {
//anchors.fill: parent

    Component.onCompleted: {
        for (var i = 0; i < 30; ++i){
            var randomValue = Utils.formatNum(Math.random(), 7);
            listTable.modelData.push( { name: "name" + randomValue,
                               value: randomValue } )
        }
        listTable.updateModel()
    }

    Dialog{
        id: dialog
        width: Utils.wp(66)
        contentHeight: Utils.hp(22)
        x: (Utils.width - width) / 2
        y: Utils.height / 6

        modal: true
        focus: true

        title: "Жест обновления сработал"
    }


    ListTable {
        anchors.fill: parent

        Component.onCompleted: {
           // returnBeginButton.anchors.right = undefined
           // returnBeginButton.anchors.left = listView.left
        }


        id: listTable
        header: ToolBar{
            id: toolBar
            height: title1.height

            Material.primary: "white"


           ButtonGroup {   //группа кнопок отвечающий за сортировку
              id: radioGroup
           }

            //Примеры кнопки сортировки по строкам
            ListTableHeaderTitle{
                id: title1
                columnIndex: 1
                textMenu.text: "Стоблец 1"
                ButtonGroup.group: radioGroup

                onSortColumn: {
                    listTable.modelData.sort(
                             sortUP === true ?
                                 function(a, b){
                                     if (a.name < b.name)
                                         return -1
                                     else return 1
                                 } : function(a, b){
                                     if (a.name > b.name)
                                          return -1
                                     else return 1
                                 }
                             )
                    listTable.updateModel()
                }
            }

            //Примеры кнопки сортировки по числам
            ListTableHeaderTitle{
                id: title2
                columnIndex: 2
                anchors.right: parent.right
                textMenu.text: "Стоблец 2"
                ButtonGroup.group: radioGroup

                onSortColumn: {
                    listTable.modelData.sort(
                             sortUP === true ?
                                 function(a, b){
                                     return a.value - b.value
                                 } : function(a, b){
                                     return b.value - a.value
                                 }
                             )
                    listTable.updateModel()
                }
            }

        }  //ToolBar



        renewGestureFunctor: function(){
            dialog.open()
        }

        delegate: Rectangle {
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("delegate clicked", model.index)
                }

                onPressAndHold: {
                    console.log("onPressAndHold", model.index)
                }

                onPressed: {
                    console.log("onPressed", model.index)
                }

                onReleased: {
                    console.log("onReleased", model.index)
                }

                onDoubleClicked: {
                    console.log("onDoubleClicked", model.index)
                }

                onCanceled: {
                    console.log("onCanceled:", model.index)
                }

            }  //Mousearea


            id: delegate
            width: parent.width
            height: Utils.hp(10)
            color: (model.index % 2) == 1 ? "gray" : "white"


            Text {
                anchors.left: parent.left
                anchors.leftMargin: Utils.wp(5)
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: Utils.dp(20)
                text: modelData.name
            }

            Text {
                anchors.right: parent.right
                anchors.rightMargin: Utils.wp(5)
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: Utils.dp(20)
                text: modelData.value
                renderType: Text.NativeRendering
            }
         }  //delegate


        footer: Rectangle{
            width: parent.width
            height: Utils.mm(10)
            color: "#f0f0f0"


            Rectangle{
                width: Utils.mm(10)
                height: Utils.mm(10)
                anchors.bottom: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                color: "green"

                Text{
                    anchors.centerIn: parent
                    verticalAlignment: Text.AlignHCenter
                    horizontalAlignment: Text.AlignVCenter
                    text: "1cm^2"
                    font.pixelSize: Utils.dp(14)
                }
            }


            Text{
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Размер этого текста зависит от настроек Android"
                font.pointSize: Utils.dp(14)
            }
        }


    }  //ListTable



}  //Item
