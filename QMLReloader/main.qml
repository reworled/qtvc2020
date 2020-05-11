import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

import qt.io 1.0

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("The Qt Company")

    Watcher {
        id: watcher

        extension: ".qml"

        onFileContentChanged: {
            var object = Qt.createQmlObject(fileContent, mom)
            if (!!object) {
                object.height = mom.height
                object.width = mom.width
                object.y = 0
                object.x = mom.width
                nextItem = object
                animateIn(object)
            }
        }

        onLegitfileChanged: {
            if (legitfile) {
                var component = Qt.createComponent("file://" + watcher.fileName)
                var instance = component.createObject(mom, { x: mom.width/2, y: 0, height: mom.height, width: mom.width })
                animateIn(instance)
                currentItem = instance
            }
        }
    }

    property var currentItem: undefined
    property var nextItem: undefined
    property var animation

    function animateIn(object) {
        animation = slider.createObject(root)
        animation.target = object
        animation.property = "x"
        animation.to = 0
        animation.from = mom.width
        animation.duration = 1000
        animation.easing.type = Easing.OutBounce
        animation.finished.connect(switchNext)
        animation.start()
    }

    function switchNext() {
        if (!!currentItem && !!nextItem) {
            currentItem.destroy()
            currentItem = nextItem
        }
        animation.destroy()
    }

    Component {
        id: slider
        PropertyAnimation {

        }
    }
    RowLayout {
        id: row
        width: parent.width
        TextField {
            id: texttt
            placeholderText: "Enter file name or click there =>"
            background: Rectangle {
                border.width: 2
                border.color: "blue"
                radius: height/5
            }
            onTextChanged: {
                watcher.fileName = text
            }
            color: text.length === 0 || watcher.legitfile ? "black" : "red"
            Layout.fillWidth: true
        }

        Button {
            text: "..."
            onClicked: fileDialog.open()
        }
    }

    Item {
        id: mom
        anchors.top: row.bottom
        width: parent.width
        anchors.bottom: parent.bottom
    }

    FileDialog {
        id: fileDialog
        title: qsTr("Choose Wisely")
        folder: shortcuts.home
        selectMultiple: false
        onAccepted: {
            texttt.text = fileDialog.fileUrl
        }
        onRejected: {
            fileDialog.close()
        }
    }
}
