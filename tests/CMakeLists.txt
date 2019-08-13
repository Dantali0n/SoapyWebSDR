project(tests)

include_directories(${CMAKE_SOURCE_DIR}/lib/include)
include_directories(${CMAKE_SOURCE_DIR}/icn/include)
include_directories(${CMAKE_SOURCE_DIR}/flp/include)
include_directories(${CMAKE_SOURCE_DIR}/epn/include)

set(LIB_INTEGRATION_SRC
        ${CMAKE_SOURCE_DIR}/icn/src/icn.cxx
        ${CMAKE_SOURCE_DIR}/flp/src/flp.cxx
        ${CMAKE_SOURCE_DIR}/epn/src/epn.cxx
        )

set(LIB_INTEGRATION_HEADERS
        ${CMAKE_SOURCE_DIR}/icn/include/icn.h
        ${CMAKE_SOURCE_DIR}/flp/include/flp.h
        ${CMAKE_SOURCE_DIR}/epn/include/epn.h
        )

add_library(O2Integration SHARED ${LIB_INTEGRATION_SRC} ${LIB_INTEGRATION_HEADERS})
set_target_properties(O2Integration PROPERTIES LINKER_LANGUAGE CXX)

find_package(
        Boost 1.53 COMPONENTS
        timer
        unit_test_framework
        REQUIRED
)

set(O2_Balancer2_TEST_LIBRARIES
        Boost::timer
        Boost::unit_test_framework
        )

set(TEST_EXAMPLE_SOURCE
        src/test-example.cxx
        )

set(TEST_EXCEPTION_SOURCE
        src/test-exception.cxx
        )

set(TEST_O2NETWORK_SOURCE
        src/test-network.cxx
        )

set(TEST_O2IP_SOURCE
        src/test-o2ip.cxx
        )

set(TEST_O2CHANNEL_SOURCE
        src/test-o2channel.cxx
        )

set(TEST_ICN_SOURCE
        src/integration/test-icn.cxx
        )

set(TEST_FLP_SOURCE
        src/integration/test-flp.cxx
        )

set(TEST_EPN_SOURCE
        src/integration/test-epn.cxx
        )

set(TEST_EPN_ICN_SOURCE
        src/integration/test-epn-icn.cxx
        )

message("O2B2: test example cxx flags: ${CMAKE_CXX_FLAGS}")
add_executable(testexample ${TEST_EXAMPLE_SOURCE})

message("O2B2: test exception cxx flags: ${CMAKE_CXX_FLAGS}")
add_executable(testexception ${TEST_EXCEPTION_SOURCE})

message("O2B2: test o2network cxx flags: ${CMAKE_CXX_FLAGS}")
add_executable(testo2network ${TEST_O2NETWORK_SOURCE})

message("O2B2: test o2ip cxx flags: ${CMAKE_CXX_FLAGS}")
add_executable(testo2ip ${TEST_O2IP_SOURCE})

message("O2B2: test o2channel cxx flags: ${CMAKE_CXX_FLAGS}")
add_executable(testo2channel ${TEST_O2CHANNEL_SOURCE})

message("O2B2: test icn cxx flags: ${CMAKE_CXX_FLAGS}")
add_executable(testicn ${TEST_ICN_SOURCE})

message("O2B2: test flp cxx flags: ${CMAKE_CXX_FLAGS}")
add_executable(testflp ${TEST_FLP_SOURCE})

message("O2B2: test epn cxx flags: ${CMAKE_CXX_FLAGS}")
add_executable(testepn ${TEST_EPN_SOURCE})

message("O2B2: test epn->icn cxx flags: ${CMAKE_CXX_FLAGS}")
add_executable(testepnicn ${TEST_EPN_ICN_SOURCE})

set(O2TEST_LIBRARIES_PACK
        O2
        ${O2_Balancer2_LIBRARIES}
        ${O2_Balancer2_TEST_LIBRARIES}
        )

set(O2TEST_INTEGRATION_LIBRARIES_PACK
        O2Integration
        ${O2TEST_LIBRARIES_PACK}
        )

target_link_libraries(
        testexample
        ${O2TEST_LIBRARIES_PACK}
)

target_link_libraries(
        testexception
        ${O2TEST_LIBRARIES_PACK}
)

target_link_libraries(
        testo2network
        ${O2TEST_LIBRARIES_PACK}
)

target_link_libraries(
        testo2ip
        ${O2TEST_LIBRARIES_PACK}
)

target_link_libraries(
        testo2channel
        ${O2TEST_LIBRARIES_PACK}
)

target_link_libraries(
        testicn
        ${O2TEST_INTEGRATION_LIBRARIES_PACK}
)

target_link_libraries(
        testflp
        ${O2TEST_INTEGRATION_LIBRARIES_PACK}
)

target_link_libraries(
        testepn
        ${O2TEST_INTEGRATION_LIBRARIES_PACK}
)

target_link_libraries(
        testepnicn
        ${O2TEST_INTEGRATION_LIBRARIES_PACK}
)

add_test(TestExample testexample)
add_test(TestException testexception)
add_test(TestO2Network testo2network)
add_test(TestO2Ip testo2ip)
add_test(TestO2Channel testo2channel)
add_test(TestIntegrationICN testicn)
add_test(TestIntegrationFLP testflp)
add_test(TestIntegrationEPN testepn)
add_test(TestIntegrationEPN->ICN testepnicn)