import QtQuick
import qmlcomps.videocamera
import JoyStickControl

Window {
    id: window
    width: 1366
    height: 768
    visible: true
    color: "#22262a"

    Row {
        anchors.centerIn: parent
        Column {
            height: 600
            width: 600
            spacing: 50
            Rectangle {
                width: 400
                height: 250
                color: 'transparent'
                border.color: "#ccc"
                radius: 10
                anchors.horizontalCenter: parent.horizontalCenter
                clip: true
                Item {
                    id: zona
                    width: parent.width
                    height: parent.height
                    Repeater {
                        model: 1000
                        Rectangle {
                            width: 7
                            height: 7
                            radius: 5
                            color: index % 2 == 0 ? Qt.darker("#ccc") : "white"
                            property double angle: 2 * index * Math.PI / 60
                            property real scaleRatio: 0.8
                            property real size: index * scaleRatio
                            x: (size + (size) * Math.cos(angle)) + ((parent.width / 2) - size)
                            y: (size + (size) * Math.sin(angle)) + ((parent.height / 2) - size)
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        drag.target: zona
                        drag.axis: Drag.XAndYAxis
                    }
                }

                Timer {
                    interval: 50
                    repeat: true
                    running: true
                    onTriggered: {
                        zona.x -= joystickSignaler_one.axisX * 10
                        zona.y += joystickSignaler_one.axisY * 10
                        zona.scale += joystickSignaler_one.zoomFactor
                    }
                }


                Rectangle {
                    width: 120
                    height: 30
                    color: Qt.darker("#ccc")
                    radius: 8
                    x: 10
                    y: 10
                    Text {
                        anchors.centerIn: parent
                        text: "X: %1, Y: %2".arg(joy.axisX.toFixed(2)).arg(joy.axisY.toFixed(2))
                        font.bold: true
                    }
                }
            }
            Column {
                width: parent.width
                Text {
                    text: "Translation"
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "white"
                    font.bold: true
                    font.pixelSize: 18
                }

                Joystick {
                    id: joy
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 300
                    height: 300
                    color: window.color
                    scaleRatio: 1
                    JoyStickSignaler {
                        id: joystickSignaler_one
                        axisX: joy.axisX
                        axisY: joy.axisY
                        zoomFactor: joy.zoomFactor
                    }
                }
            }
        }
    }
}
