import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
color: "#c0ffee"

property alias speed: speedSlide.value
property alias rpm: rpmSlide.value
property alias automate: swi.checked


    Column {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        Text {
            text: qsTr("SPEED: %1 arbitrary units/hours").arg(speedSlide.value)
        }
        Slider {
            id: speedSlide
            width: parent.width
            from: 0; to: 120
            orientation: Qt.Horizontal
            enabled: !swi.checked
        }
        Text {
            text: qsTr("RPM: %1").arg(rpmSlide.value)
        }
        Slider {
            id: rpmSlide
            width: parent.width
            from: 0; to: 9000
            orientation: Qt.Horizontal
            enabled: !swi.checked
        }
        Text {
            text: qsTr("Use animated values")
        }

        Switch {
            id: swi
            checked: true
        }
    }

}
