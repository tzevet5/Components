import QtQuick 2.0
import Qt5Compat.GraphicalEffects

Item {
    id: root
    width: 2 * radius
    height: 2 * radius

    property double radius: 12
    property string backgroundColor: "#34393f"
    property string lightColor: "#8bfcee"
    property bool lightOn: false
    property double lightBrightness: 1.0

    Rectangle {
        id: background
        anchors.fill: parent
        radius: parent.radius
        color: backgroundColor
    }

    Rectangle {
        id: light
        anchors.fill: parent
        radius: parent.radius
        visible: lightOn
        opacity: lightBrightness
        layer.enabled: true
        layer.effect: Glow {
            anchors.fill: root
            radius: 2 * root.radius
            samples: 24
            color: lightColor
            source: light
        }
    }
}

