find_package(Qt6 COMPONENTS Quick Qml Core5Compat REQUIRED)

qt6_add_library(videocamera STATIC)

qt_add_qml_module(videocamera
  URI qmlcomps.videocamera
  VERSION 1.0
  SOURCES
    camera.cpp
    camera.h
    joystickersignaler.h
    joystickersignaler.cpp
  QML_FILES
    Back.qml
    Groove.qml
    Handle.qml
    Joystick.qml
    Lights.qml
    SparseLight.qml
)

target_link_libraries(videocamera PRIVATE Qt6::Core5Compat Qt6::Qml Qt6::Quick)
