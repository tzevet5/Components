option(BUILD_DEMO "Enable building demo project(" ON)
if(BUILD_DEMO)
  add_subdirectory(demo)
endif()
