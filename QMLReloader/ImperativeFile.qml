import QtQuick 2.0

Rectangle {
    id: root

    property string textString: "This is the text"

    Text {
        anchors.centerIn: parent
        text: root.textString
        color: "white"        
    }

    Rectangle {
        id: rect
        anchors.centerIn: parent
        width: 2*200; height: 1.5*100
        color: ma.pressed ? Qt.lighter("#781514") : "#781514"
        MouseArea {
            id: ma
            anchors.fill: parent
            onClicked: {
                if (ra.running) {
                    if (ra.paused)
                        ra.resume()
                    else
                        ra.pause()
                } else {
                    ra.running = !ra.running
                }
            }
        }
    }

    // Can we really animate a STRING ?
    PropertyAnimation {
        id: pa
        target: root
        property: "textString"
        from: "Hi"
        to: "Hellow"
        duration: 600
    }

    RotationAnimation {
        id: ra
        duration: 1500
        target: rect
        from: 0; to: 720
        easing.type: Easing.InOutQuad
        onStarted: root.textString = "Started"
        onStopped: root.textString = "Stopped"
        onPausedChanged: root.textString = "Paused: " + paused
    }

    color: Qt.lighter("green")
}

