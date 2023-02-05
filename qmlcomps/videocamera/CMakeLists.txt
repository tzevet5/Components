add_library(videocamera STATIC camera.cpp camera.h)

# target_link_libraries(videocamera ${PROJECT_NAME})

target_include_directories(videocamera INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
# The library API is defined in the header file businesslogic/businesslogic.h.
# By calling target_include_directories, we make sure that the absolute path to
# the businesslogic directory is automatically added as an include path to all
# targets using our library
qt_add_qml_module(
  videocamera
  URI
  qmlcomps.videocamera
  VERSION
  1.0
  QML_FILES
  Handle.qml
  Joystick.qml
  Light.qml
  SparseLight.qml) # used instead of add_library
