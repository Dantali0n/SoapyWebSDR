cmake_minimum_required(VERSION 2.8.4)
project(SoapyWebSDR)

# Check if you're in the root directory of the project, and give an error.
IF(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
    MESSAGE(FATAL_ERROR "Please create a dedicated build directory for this load balancer. (You may need remove the CmakeCache.txt and the cache)")
ENDIF()

# Add custom cmake modules
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(macros)

# Enable c++11 even when cmake < 3.1
use_cxx11()

# Enable pedantic errors and warnings for c++
use_cxx_warning_pedantic()

# Configurable options and defaults
OPTION(ENABLE_TESTS "Enable unit tests" ON)
#OPTION(ENABLE_CODECOV "Measure code coverage" OFF)
OPTION(ENABLE_DOXY "Generate documentation" ON)
OPTION(ENALBE_TRAVIS "If this build is being run on travis.ci" OFF)

# Required packages
set(CMAKE_THREAD_PREFER_PTHREAD TRUE)
set(THREADS_PREFER_PTHREAD_FLAG TRUE)
find_package(Threads REQUIRED)
find_package(FFTW REQUIRED)
find_package(m REQUIRED)
find_package(gd REQUIRED)
find_package(sndfile REQUIRED)
find_package(asound REQUIRED)
find_package(SoapySDR "0.4.0" NO_MODULE REQUIRED)

# Include Commonly required headers
include_directories(${SOAPY_SDR_INCLUDE_DIR})
include_directories(${FFTW_INCLUDES})
include_directories(${M_INCLUDES})
include_directories(${GD_INCLUDES})
include_directories(${SNDFILE_INCLUDES})
include_directories(${ASOUND_INCLUDES})

# Set Commonly required libraries
set(SoapyWebSDR_LIBRARIES
        Threads::Threads
        ${SOAPY_SDR_LIBRARY}
        ${M_LIBRARIES}
        ${FFTW_LIBRARIES}
        ${SNDFILE_LIBRARIES}
        ${ASOUND_LIBRARIES}
        ${GD_LIBRARIES}
        z
        jpeg
        freetype
        rtlsdr
        mirsdrapi-rsp
)

# CodeCoverage generation will force enable debug and tests
#if(ENABLE_CODECOV)
#    message("SoapyWebSDR: Running CodeCoverage, forcing ENABLE_TESTS & CMAKE_BUILD_TYPE=Debug")
#    include(CodeCoverage)
#    setup_target_for_coverage(coverage testexample coverage)
#    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-arcs -ftest-coverage")
#    set(ENABLE_TESTS ON) # tests need to be enabled for code coverage
#    if(NOT CMAKE_BUILD_TYPE STREQUAL "Debug")
#        message(WARNING "Forcing buld type to Debug to allow code coverage!")
#        set(CMAKE_BUILD_TYPE Debug) # debug needed to disable compiler optimization
#    endif()
#endif()

# Set correct optimization and debug flags depending on build type
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    message("SoapyWebSDR: Disabling gcc optimization & adding extensive debug symbols")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g3 -O0")
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    message("SoapyWebSDR: Optimizing the living shit out of gcc")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Ofast")
endif()

# Application
add_subdirectory(soapywebsdr)

#add_custom_target(websdr COMMAND make -C ${websdr_SOURCE_DIR}
#        CLION_EXE_DIR=${PROJECT_BINARY_DIR})

# Unit tests to validate application
#if(ENABLE_TESTS)
#    message("SoapyWebSDR: Enabling tests")
#    ENABLE_TESTING()
#    add_subdirectory(tests)
#endif()

# Generate Doxygen Documentation
if(ENABLE_DOXY)
    find_package(Doxygen)
    if (DOXYGEN_FOUND)
        # set input and output files
        set(DOXYGEN_IN ${CMAKE_CURRENT_SOURCE_DIR}/doxygen.cnf)
        set(DOXYGEN_OUT ${CMAKE_CURRENT_BINARY_DIR}/doxygen.cnf)

        # request to configure the file
        configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)
        message("SoapyWebSDR: Doxygen build started")

        # note the option ALL which allows to build the docs together with the application
        if(NOT ENABLE_TRAVIS)
            add_custom_target(doc_doxygen ALL
                    COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
                    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                    COMMENT "Generating API documentation with Doxygen"
                    VERBATIM )
        endif(NOT ENABLE_TRAVIS)
    else (DOXYGEN_FOUND)
        message("SoapyWebSDR: Doxygen needs to be installed to generate the doxygen documentation")
    endif (DOXYGEN_FOUND)
endif()