import QtQuick 2.0

import QtQuick.Controls 2.12

Rectangle {

    id: root

    property alias heading: combo.heading
    signal flip()

    Column {
        anchors.fill: parent
        ComboBox {
            id: combo
            model: [ 'N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW' ]

            property int heading: {
                combo.currentIndex * 45
            }
        }
        Text {
            anchors.margins: 20
            text: qsTr("Heading: %1 degrees, %2").arg(combo.heading).arg(combo.currentText)
        }
        Button {
            text: qsTr(":-)")
            onClicked: root.flip()
        }
    }
}
