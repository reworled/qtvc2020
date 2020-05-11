import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    visible: true
    width: 640
    height: 480

    property Animation animationToRun: parallel

    property int speed: 600

    MouseArea {
        id: ma1
        anchors.fill: parent
        onClicked: {
            animationToRun.start()
        }
    }

    Rectangle {
        id: rect
        color: "red"
        x: 0
        y: 0
        width: 10
        height: 10

        MouseArea {
            id: ma2
            anchors.fill: parent
            onClicked: {
                rect.x = 0; rect.y = 0; rect.width = 10; rect.height = 10
                animationToRun = sequential
            }
        }
    }


    ParallelAnimation {
        id: parallel
        NumberAnimation {
            target: rect
            property: "width"
            duration: window.speed
            easing.type: Easing.InOutQuad
            to: window.width - rect.width
        }
        NumberAnimation {
            target: rect
            property: "height"
            duration: window.speed
            easing.type: Easing.InOutQuad
            to: window.height - rect.height
        }
        NumberAnimation {
            target: rect
            properties: "x, y"
            duration: window.speed
            to: 400
            easing.type: Easing.InOutQuad
        }
    }

    SequentialAnimation {
        id: sequential
        NumberAnimation {
            target: rect
            property: "width"
            duration: window.speed
            easing.type: Easing.InOutQuad
            to: window.width - rect.width
        }
        NumberAnimation {
            target: rect
            property: "height"
            duration: window.speed
            easing.type: Easing.InOutQuad
            to: window.height - rect.height
        }
        NumberAnimation {
            target: rect
            properties: "x, y"
            duration: window.speed
            to: 400
            easing.type: Easing.InOutQuad
        }
    }
}
