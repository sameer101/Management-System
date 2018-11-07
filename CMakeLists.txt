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
add_subdirectory(${VIEW_DIR})
add_subdirectory(${CONTROLLER_DIR})
add_subdirectory(${MODEL_DIR})
set(QML_FILES
    ${SRC_DIR}/main.qml
    #components
    ${VIEW_DIR}/components/SideTabBar.qml
    ${VIEW_DIR}/components/SideBarElement.qml
    ${VIEW_DIR}/components/Cart.qml
    ${VIEW_DIR}/components/MainContent.qml
    ${VIEW_DIR}/components/TopContent.qml
    ${VIEW_DIR}/components/ControlsBar.qml)

set(SRC_FILES
    ${SRC_DIR}/main.cpp)
set(HEADER_FILES )
set(QML_SOURCES
    ${SRC_DIR}/qml.qrc)



find_package(Qt5 COMPONENTS Core Quick REQUIRED)

qt5_add_resources(QT_RESOURCES ${QML_SOURCES})

add_executable(${PROJECT_NAME} ${QT_RESOURCES} ${SRC_FILES} ${QML_FILES})

target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Quick)
