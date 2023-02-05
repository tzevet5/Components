cmake_minimum_required(VERSION 3.16)

project(
  qmlcomps
  VERSION 0.1.0
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Gui Quick)
qt_standard_project_setup()
# The qt_standard_project_setup command sets project-wide defaults for a typical
# Qt application. Among other things, this command sets the CMAKE_AUTOMOC
# variable to ON, which instructs CMake to automatically set up rules so that
# Qt's Meta-Object Compiler (moc) is called transparently, when required.

add_library(${PROJECT_NAME} qmlcomps)
target_link_libraries(${PROJECT_NAME} PUBLIC Qt6::Gui Qt6::Quick)
add_subdirectory(qmlcomps)
