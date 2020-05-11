import QtQuick 2.0

Item {
    id: root

    Rectangle {
        id: r1
        anchors.top: parent.top
        anchors.left: parent.left
        width: parent.width / 2
        height: parent.height / 2
        color: "transparent"
        border.width: 2
        border.color: "#781514"
        MouseArea {
            id: ma1
            anchors.fill: parent
            hoverEnabled: true
        }
    }
    Rectangle {
        id: r2
        anchors.top: parent.top
        anchors.right: parent.right
        width: parent.width / 2
        height: parent.height / 2
        color: "transparent"
        border.width: 2
        border.color: "#781514"
        MouseArea {
            id: ma2
            anchors.fill: parent
            hoverEnabled: true
        }
    }
    Rectangle {
        id: r3
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width / 2
        height: parent.height / 2
        color: "transparent"
        border.width: 2
        border.color: "#781514"
        MouseArea {
            id: ma3
            anchors.fill: parent
            hoverEnabled: true
        }
    }
    Rectangle {
        id: r4
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width / 2
        height: parent.height / 2
        color: "transparent"
        border.width: 2
        border.color: "#781514"
        MouseArea {
            id: ma4
            anchors.fill: parent
            hoverEnabled: true
        }
    }

    // This is called the default state. We don't
    // need to explicitly set it.
    state: ""
    states: [
        State {
            name: "s1"
            when: ma1.containsMouse
            PropertyChanges {
                target: r1
                color: "blue"
            }
        },
        State {
            name: "s2"
            when: ma2.containsMouse
            PropertyChanges {
                target: r2
                color: "green"
            }
        },
        State {
            name: "s3"
            when: ma3.containsMouse
            PropertyChanges {
                target: r3
                color: "orange"
            }
        },
        State {
            name: "s4"
            when: ma4.containsMouse
            PropertyChanges {
                target: r4
                color: "#c0ffee"
            }
        }
    ]

    // Transitions part of the demo, it's on the next slide!!
/*
    transitions: [
        Transition {
            ColorAnimation {
                duration: 600
            }
        }
    ]
/**/
}
