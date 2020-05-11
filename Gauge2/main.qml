import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Gauges 2: a compass")
    color: "#c0c0c0"

    Compass {
        id: compass
        x: 10; y: x
        heading: controller.heading
    }

    Controller {
        id: controller
        anchors.left: compass.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: 10
        onFlip: compass.flip()
    }
}
