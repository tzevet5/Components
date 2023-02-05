set(DEMO "DEMO")
add_executable(${DEMO} main.cpp)

qt_add_qml_module(
  ${DEMO}
  URI
  demo
  VERSION
  1.0
  QML_FILES
  main.qml)
target_link_libraries(${DEMO} PRIVATE ${PROJECT_NAME})
