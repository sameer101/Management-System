cmake_minimum_required(VERSION 3.1)

project(Mnagement LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SRC_DIR src)
set(VIEW_DIR ${SRC_DIR}/view)
set(CONTROLLER_DIR ${SRC_DIR}/controller)
set(MODEL_DIR ${SRC_DIR}/model)
set(DB_DIR ${SRC_DIR}/database)
set(COMMON_DIR ${SRC_DIR}/common)
set(SERVICE_DIR ${SRC_DIR}/service)
add_subdirectory(${VIEW_DIR})
add_subdirectory(${CONTROLLER_DIR})
add_subdirectory(${MODEL_DIR})
add_subdirectory(${DB_DIR})
add_subdirectory(${SERVICE_DIR})
set(QML_FILES
    ${SRC_DIR}/main.qml
    #view
    ${VIEW_DIR}/Products.qml
    ${VIEW_DIR}/MainContent.qml
    ${VIEW_DIR}/Records.qml
    #components
    ${VIEW_DIR}/components/SideTabBar.qml
    ${VIEW_DIR}/components/SideBarElement.qml
    ${VIEW_DIR}/components/Cart.qml
    ${VIEW_DIR}/components/TopBar.qml
    ${VIEW_DIR}/components/BottomBar.qml
    ${VIEW_DIR}/components/ControlBarElement.qml
    ${VIEW_DIR}/components/ControlsBar.qml)

set(SRC_FILES
    ${SRC_DIR}/main.cpp
    #common Directory
    ${COMMON_DIR}/Settings.cpp
    # Model Directory
    ${MODEL_DIR}/user.cpp
    # Model Directory
    ${DB_DIR}/SqliteDB.cpp
    # Service Directory
    ${SERVICE_DIR}/networkdevicesservice.cpp)

set(HEADER_FILES
    #common Directory
    ${COMMON_DIR}/Settings.h
    #contror diercory
    ${CONTROLLER_DIR}/DatabaseService.h
    # Model Directory
    ${MODEL_DIR}/user.h
    # DB Directory
    ${DB_DIR}/IDataBase.h
    ${DB_DIR}/SqliteDB.h
    # Service Directory
    ${SERVICE_DIR}/networkdevicesservice.h)
set(QML_SOURCES
    ${SRC_DIR}/qml.qrc)

set(JS_FILES
    ${VIEW_DIR}/js/Material-icons.js
    ${VIEW_DIR}/js/Settings.js)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)
find_package(Qt5Sql   REQUIRED)
find_library(WSOCK32_LIBRARY wsock32)
find_library(WS2_32_LIBRARY ws2_32)


qt5_add_resources(QT_RESOURCES ${QML_SOURCES})


add_executable(${PROJECT_NAME} ${QT_RESOURCES} ${SRC_FILES}  ${HEADER_FILES} ${QML_FILES} ${JS_FILES})

target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Quick Qt5::Sql ws2_32 wsock32 iphlpapi)
