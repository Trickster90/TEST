import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 360
    height: 560
    title: qsTr("Hello World")

    onClosing: {
        close.accepted = false
    }

Rectangle{
    anchors.fill: parent
    focus: true

    Keys.onReleased: {
        console.log("onReleased", event.key)
        releasedText.text = "onReleased " + event.key
    }
//event.matches(StandardKey.Back)
    Keys.onPressed: {
        console.log("onPressed", event.key)
        pressedText.text = "onPressed " + event.key
    }




    Text {
        id: pressedText
        x: 0
        y: 21
        width: 207
        height: 46
        text: qsTr("Text")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 40
    }

    Text {
        id: releasedText
        x: 0
        y: 103
        width: 206
        height: 58
        text: qsTr("Text")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 40
    }

    Text {
        id: text1
        x: 0
        y: 84
        width: 206
        height: 19
        text: qsTr("Released")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 12
    }

    Text {
        id: text2
        x: 1
        y: 0
        width: 206
        height: 19
        text: qsTr("Pressed")
        font.pixelSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

}


}
