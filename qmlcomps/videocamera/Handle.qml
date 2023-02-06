import QtQuick 2.0
import Qt5Compat.GraphicalEffects
Item {
    property double radius: 230
    property string color: "#34393f"
    property string lightColor: "#8bfcee"

    id: root
    width: 2 * radius
    height: 2 * radius

    Rectangle {
        anchors.centerIn: root
        width: 2 * radius
        height: 2 * radius
        radius: 0.94 * root.radius
        color: root.color
        layer.enabled: true
        layer.effect:
            DropShadow {
            color: "#80000000"
            radius: 48 / 230 * root.radius
            samples: 32
        }
        Repeater {
            model: 4
            Rectangle {
                id: mega
                width: 15
                height: 15
                color: "transparent"
                Text {
                    id: texto
                    anchors.centerIn: parent
                    text: "〉"
                    rotation: index * 90
                    color: lightColor
                    font.bold: true
                    font.weight: Font.Bold

                    font.pixelSize: 12 * scaleRatio
                    layer.enabled: true
                    layer.effect: Glow {
                        anchors.fill: mega
                        radius: 2 * root.radius
                        samples: 24
                        color: lightColor
                        source: texto
                    }
                }

                property double angle: 2 * index * Math.PI / 4
                radius: 12 / 240 * root.radius
                x: (root.radius - radius + (root.radius - radius - 10) * Math.cos(angle)) - width / 2
                y: (root.radius - radius + (root.radius - radius - 10) * Math.sin(angle)) - height / 2
            }
        }
    }


}

