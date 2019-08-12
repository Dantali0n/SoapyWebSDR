cmake_minimum_required(VERSION 2.8.4)
project(websdr)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

add_custom_target(websdr COMMAND make -C ${websdr_SOURCE_DIR}
        CLION_EXE_DIR=${PROJECT_BINARY_DIR})