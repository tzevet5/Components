import QtQuick

Item {
    id: root
    width: 1340
    height: 1340

    property double scaleRatio: 1
    property string color: "#22262a"
    property bool pressedOnHandle: false
    property double axisX: 0
    property double axisY: 0
    property double zoomFactor: 0
    property double theta: 0
    property double radius: 0
    readonly property double maxRadius: width / 4.5

    function update() {
        handle.x = ((width / 2) - (handle.width / 2)) + maxRadius * axisX
        handle.y = ((height / 2) - (handle.height / 2)) - maxRadius * axisY

        for (var i = 0; i < lights.lights.count; i++) {
            var tempTheta = -theta

            if (tempTheta < 0)
                tempTheta += 2 * Math.PI

            var angleBetween = Math.abs(
                        tempTheta - lights.lights.itemAt(i).angle)

            lights.lights.itemAt(
                        i).lightOn = (angleBetween < Math.PI / 6
                                      || angleBetween > 2 * Math.PI - Math.PI / 6)
            lights.lights.itemAt(i).lightBrightness = Math.min(
                        axisX * axisX + axisY * axisY, 1)
        }
    }

    function reset() {
        axisX = 0
        axisY = 0
        theta = 0
        pressedOnHandle = false
        root.update()
    }

    onScaleRatioChanged: reset()

    Item {
        id: center
        anchors.centerIn: parent
    }

    Back {
        id: back
        anchors.centerIn: parent
        radius: parent.width / 3
        color: root.color
    }

    Groove {
        anchors.centerIn: parent
        radius: parent.width / 4
        color: root.color
    }

    Lights {
        id: lights
        anchors.centerIn: parent
        radius: parent.width / 2.3
    }

    Handle {
        id: handle
        x: (parent.width / 2) - (width / 2)
        y: (parent.height / 2) - (height / 2)
        radius: parent.width / 6
        color: root.color

        Item {
            id: handleCenter
            anchors.centerIn: handle
        }
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            var point = mapToItem(handleCenter, mouseX, mouseY)
            pressedOnHandle = point.x * point.x + point.y * point.y < handle.radius * handle.radius
        }

        onReleased: reset()

        onPositionChanged: {
            if (pressedOnHandle) {
                var point = mapToItem(center, mouseX, mouseY)
                var length = Math.sqrt(point.x * point.x + point.y * point.y)
                if (length > maxRadius)
                    length = maxRadius

                theta = Math.atan2(-point.y, point.x)

                axisX = length * Math.cos(theta) / maxRadius
                axisY = length * Math.sin(theta) / maxRadius

                root.update()
            }
        }

        onWheel: function (event) {
            zoomFactor = event.pixelDelta.y / 20
        }
    }
}
