import QtQuick 2.0


Item {
    id: root

    width: 400; height: width

    property int heading: -10

    property int innerHeading: {
        if (heading < 0)
            return 0
        if (heading > 359)
            return 359
        return heading
    }

    property bool flipped: false
    function flip() {
        root.flipped = !root.flipped
    }


    Flipable {
        id: flipper
        anchors.fill: parent
        transform: Rotation {
            origin.x: flipper.width/2
            origin.y: flipper.height/2
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: root.flipped ? 180 : 0
            Behavior on angle {
                NumberAnimation { duration: 650; easing.type: Easing.InOutCubic }
            }
        }

        front: Image {
            anchors.centerIn: parent
            source: "background.png"

            Image {
                id: needle
                x: 161; y: 38
                source: "needle.png"
                transform: Rotation {
                    id: r
                    origin.x: needle.width/2
                    origin.y: needle.height/2
                    angle: root.innerHeading

                    Behavior on angle {
                        RotationAnimation { duration: 700; easing.type: Easing.InOutCubic; direction: RotationAnimation.Shortest }
                    }
                }
            }
        }

        back: Rectangle {
            anchors.fill: parent
            color: "transparent"
            Rectangle {
                border.color: "black"
                anchors.centerIn: parent
                width: 150; height: 150
                radius: width/2
                clip: true
                PathView {
                    currentIndex: root.heading/45

                    anchors.centerIn: parent
                    height: 400; width: 400
                    path: path
                    model: [ 'N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW' ]
                    delegate: Text {
                        text: modelData
                        font.pixelSize: 20
                        scale: PathView.iconScale
                        rotation: PathView.iconRotation
                        opacity: PathView.iconOpacity
                    }
                    preferredHighlightBegin: 0.5
                    preferredHighlightEnd: 0.5
                    highlightMoveDuration: 900
                    interactive: false
                }
            }

            Canvas {
                anchors.fill: parent
                visible: false
                onPaint: {
                    var context = getContext('2d')
                    context.strokeStyle = "red"
                    context.path = path
                    context.stroke()
                }
            }

            Path {
                id: path
                startX: 0
                startY: 400
                PathAttribute {
                    name: "iconScale"
                    value: 0.01
                }
                PathAttribute {
                    name: "iconRotation"
                    value: -90
                }
                PathAttribute {
                    name: "iconOpacity"
                    value: 0.1
                }
                PathArc {
                    x: 200
                    y: 190
                    radiusX: 200
                    radiusY: 200
                    useLargeArc: false
                }
                PathAttribute {
                    name: "iconScale"
                    value: 3.0
                }
                PathAttribute {
                    name: "iconRotation"
                    value: 0
                }
                PathAttribute {
                    name: "iconOpacity"
                    value: 1
                }
                PathArc {
                    x: 400
                    y: 400
                    radiusX: 200
                    radiusY: 200
                    useLargeArc: false
                }
                PathAttribute {
                    name: "iconScale"
                    value: 0.01
                }
                PathAttribute {
                    name: "iconRotation"
                    value: 90
                }
                PathAttribute {
                    name: "iconOpacity"
                    value: -1
                }
            }
        }
    }

}


