import QtQuick 2.0
import QtGraphicalEffects 1.0


Item {

    property alias source: image.source
    property alias color: overlay.color

    width: image.width
    height: image.height

    function toggle() {
        image.visible = !image.visible
    }

    Image {
        id: image
    }

    ColorOverlay {
        id: overlay
        anchors.fill: image
        source: image
        color: "transparent"
        visible: !image.visible
    }
}
