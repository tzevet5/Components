import QtQuick
import Qt5Compat.GraphicalEffects

Rectangle {
    radius: 356
    color: "#34393f"

    id: root
    width: 2 * radius
    height: 2 * radius
    antialiasing: true
    border.color: Qt.lighter(root.color, 1.25)
    border.width: 6 / 356 * radius
    smooth: true

    layer.enabled: true
    layer.effect: DropShadow {
        color: "#40000000"
        horizontalOffset: 24 / 356 * root.radius
        verticalOffset: 24 / 356 * root.radius
        radius: 32 / 356 * root.radius
        samples: 32
    }
}
