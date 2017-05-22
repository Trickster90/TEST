import QtQuick 2.0




Item {
    Keys.onReleased: {
        console.log("onReleased", event.key)
        releasedText.text = "onReleased " + event.key
    }

//event.matches(StandardKey.Back)

    Keys.onPressed: {
        console.log("onPressed", event.key)
        pressedText.text = "onPressed " + event.key
    }

//    onClosing: {
//            close.accepted = false
//    }



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
