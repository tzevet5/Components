import QtQuick
import qmlcomps.videocamera 1.0

Window {
    id: window
    width: 1366
    height: 768
    visible: true
    color: "#22262a"

    Joystick {
        anchors.centerIn: parent
        width: 1340 * scaleRatio
        height: 1340 * scaleRatio
        color: window.color
        scaleRatio: 0.7 * Math.min(window.height / 1366, window.width / 768)
    }
}
