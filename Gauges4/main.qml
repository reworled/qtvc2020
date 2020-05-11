import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    title: qsTr("Super Snow Mobile")
    width: 640
    height: 480

    SuperSnowGaugesUnit {
        id: ssgu
        anchors.top: parent.top
        anchors.margins: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: 500
        height: 200
        speed: controller.automate ? animatedValue/100 : controller.speed
        rpm: controller.automate ? animatedValue : controller.rpm
    }

    property real animatedValue: 150
    Behavior on animatedValue {
        NumberAnimation { duration: 2300; easing.type: Easing.InOutQuart }
    }

    Timer {
        interval: 2500
        repeat: true
        running: true
        onTriggered: {
            animatedValue = Math.random() * 9000
        }
    }

    Controller {
        id: controller
        anchors.top: ssgu.bottom
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10
        width: parent.width
    }

}
