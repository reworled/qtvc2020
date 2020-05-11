import QtQuick 2.0

Item {
    id: root

    property Item homeTarget
    property alias elementIndex: dragRectangle.elementIndex

    property string theName
    property int numer

    signal reorder(int to, int from)


    Rectangle {
        id: dragRectangle
        property int elementIndex
//        anchors.fill: parent
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        // anchors.fill: parent is better code, but in this case we use seperate values. Why?
        color: "transparent"
        border.color: "#d45"
        border.width: 1
        Drag.active: ma.drag.active
        Rectangle {
            anchors.fill: parent
            opacity: 0.3
            color: ma.pressed ? "#781514" : "#c0ffee"
            Behavior on color {
                ColorAnimation {
                    duration: 200
                }
            }
        }
        Text {
            anchors.centerIn: parent
            // This is passed straight from the model and gets here via scoping rules.
            // it's not considered good form to use these: safer to connect properties.
            // But it does work.
            text: name + ", " + value
        }
    }

    DropArea {
        id: dropArea
        width: parent.width
        height: parent.height
        // Why is the Y offset this way?
        y: height * - 0.5
        onEntered: {
            if (drag.source.elementIndex !== elementIndex) {
                root.reorder(drag.source.elementIndex, elementIndex)
                drag.accept(Qt.MoveAction)
            }
        }
    }

    MouseArea {
        id: ma
        anchors.fill: parent
        drag.target: dragRectangle
        drag.axis: Drag.YAxis
    }

    states: [
        State {
            name: "dragging"
            when: ma.pressed
            ParentChange { target: dragRectangle; parent: root.homeTarget }
            AnchorChanges { target: dragRectangle; anchors.top: undefined; anchors.right: undefined; anchors.bottom: undefined; anchors.left: undefined }
        }
    ]
}
