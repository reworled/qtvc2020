import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {

    id: root

    property int currentRpm
    property int maxRpm: 9000

    function nudgeMode() {
        imode.mode++
        if (imode.mode > imode.maxMode)
            imode.mode = 0
    }

    QtObject {
        id: imode
        property int mode: 0
        property int maxMode: 2
    }

    QtObject {
        id: internal
        property point focusPoint: Qt.point(195,13)
        property real rotationAtZero: 127.5
        property real rotationAtMax: 7.5
        property real rotationRange: rotationAtZero - rotationAtMax
        property real rotation: rotationAtZero - ((root.currentRpm/root.maxRpm) * rotationRange)
    }

    Image {
        id: background
        anchors.fill: parent
        source: "desktop.png"
    }

    Image {
        anchors.fill: parent
        source: "background.png"
    }
    Image {
        id: overlay
        anchors.fill: parent
        source: "overlay.png"
        visible: false
    }

    Item {
        id: opacityMaskSource
        anchors.fill: parent
        visible: opacity > 0.01
        opacity: imode.mode !== 2 ? 0 : 1
        Behavior on opacity {
            NumberAnimation { duration: 900 }
        }

        Rectangle {
            color: "#e1ad01"
            x: 0; y: internal.focusPoint.y
            width: parent.width
            height: parent.height //the height fits - for a longer gauge, make this longer!

            transform: Rotation {
                id: r
                origin.x: internal.focusPoint.x
                origin.y: 0
                angle: internal.rotation
            }
        }

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            border.color: "#781514"
            border.width: 4
        }
    }


    OpacityMask {
        anchors.fill: overlay
        source: overlay
        maskSource: opacityMaskSource
    }

    Image {
        anchors.fill: parent
        source: "lines.png"
    }

    Rectangle {
        x: internal.focusPoint.x; y: internal.focusPoint.y
        width: 6; height: 6
        radius: 3
        color: "red"
        opacity: imode.mode === 0 ? 0 : 1
        Behavior on opacity {
            NumberAnimation { duration: 300 }
        }
    }
}
