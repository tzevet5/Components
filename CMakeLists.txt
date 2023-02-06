cmake_minimum_required(VERSION 3.16)

project(
  qmlcomps
  VERSION 0.1.0
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 COMPONENTS Quick Qml REQUIRED)

# Submodule loading
add_subdirectory(qmlcomps)

option(BUILD_DEMO "Enable building demo project(" ON)
if(BUILD_DEMO)
    add_executable(demoapp qmlcomps/demo/main.cpp qmlcomps/demo/rc.qrc)
    target_link_libraries(demoapp PRIVATE Qt::Quick Qt::Qml videocameraplugin)
endif()

