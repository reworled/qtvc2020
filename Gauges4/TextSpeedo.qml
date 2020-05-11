import QtQuick 2.0

Item {

    id: root

    property int speed: 0

    QtObject {
        id: internal
        readonly property int speed: root.speed

        property Timer t: Timer {
            running: internal.speed !== internal.currentSpeed
            interval: 20
            repeat: true
            onTriggered: {
                if (internal.speed !== internal.currentSpeed) {
                    if (internal.speed < internal.currentSpeed) {
                        internal.currentSpeed--
                    } else {
                        internal.currentSpeed++
                    }
                }
            }
        }

        property int currentSpeed
        property string displaySpeed: currentSpeed

    }

    Row {
        anchors.fill: parent
        Repeater {
            model: internal.displaySpeed.length
            Text {
                text: internal.displaySpeed[index]
                font.family: "Times"
                font.pixelSize: 78
                font.italic: true
                width: 40
                height: font.pixelSize + 6
            }
        }
    }

}
