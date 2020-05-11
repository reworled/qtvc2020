import QtQuick 2.0
import QtGraphicalEffects 1.0


Item {

    property alias rpm: bg.currentRpm
    property alias speed: textSpeed.speed

    BauerGauge {
        id: bg
        anchors.fill: parent
        currentRpm: 0
    }

    TextSpeedo {
        id: textSpeed
        x: 130
        y: 30
        width: 110
        height: 30
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            bg.nudgeMode()
        }
    }

    OverlayIcon {
        source: "gas.png"
        color: "red"
        x: 380; y: 11
        MouseArea {
            anchors.fill: parent
            onClicked: parent.toggle()
        }
    }
    OverlayIcon {
        source: "coolant.png"
        color: "red"
        x: 320; y: 11
        MouseArea {
            anchors.fill: parent
            onClicked: parent.toggle()
        }
    }
}
