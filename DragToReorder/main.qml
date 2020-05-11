import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 240
    height: 640
    title: qsTr("Drag to re-order")


    ListView {
        id: view
        anchors.fill: parent
        model: listModel
        delegate: ReOrderDelegate {
            width: parent.width
            height: view.height/view.model.count
            homeTarget: view
            elementIndex: index
            onReorder: listModel.move(from, to, 1)
        }
        move: Transition {
            NumberAnimation { property: "y"; duration: 600; easing.type: Easing.InOutQuad }
        }
    }

    // In this case we are using a ListModel, but you can aöso use a QAbstractItemModel - that way,
    // you would be updating actual real C++ data as well!
    // It's also possible to connect the ListModel up to an entirely different model type, such as a
    // JavaScript array, and rebuild the array as the model changes. Not so simple, but absolutely
    // would work.
    ListModel {
        id: listModel
        ListElement {
            name: "One"
            value: 1
        }
        ListElement {
            name: "Two"
            value: 2
        }
        ListElement {
            name: "Three"
            value: 3
        }
        ListElement {
            name: "Four"
            value: 4
        }
        ListElement {
            name: "Five"
            value: 5
        }
        ListElement {
            name: "Six"
            value: 6
        }
        ListElement {
            name: "Seven"
            value: 7
        }
        ListElement {
            name: "Eight"
            value: 8
        }
        ListElement {
            name: "Nine"
            value: 9
        }
        ListElement {
            name: "Ten"
            value: 10
        }
    }
}
