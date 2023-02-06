import QtQuick
import Qt5Compat.GraphicalEffects

Rectangle {
    radius: 512
    rotation: -40
    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: Qt.darker(root.color, 1.25);
        }
        GradientStop {
            position: 1.25;
            color: Qt.lighter(root.color, 1.25);
        }
    }
    color: "#34393f"

    id: root
    width: 2 * radius
    height: 2 * radius
    antialiasing: true
    smooth: true

    layer.enabled: false
    layer.effect: InnerShadow {
        color: "#80000000"
        radius: 64 / 512 * root.radius
        samples: 32
    }
}

