set(BIN_SOAPYWEBSDR_SOURCE
    antialiasing.c
    audio.c
    audio_bandpass.c
    cat.c
    civ.c
    color.c
    downmixer.c
    fifo.c
    fir_table_calc.c
    hilbert90.c
    rtlsdr.c
    sdrplay.c
    setqrg.c
    ssbfft.c
    timing.c
    websdr.c
    wf_univ.c
    websocket/base64.c
    websocket/handshake.c
    websocket/sha1.c
    websocket/websocketserver.c
    websocket/ws.c
    websocket/ws_callbacks.c
)

set(BIN_SOAPYWEBSDR_HEADERS
    antialiasing.h
    audio.h
    audio_bandpass.h
    cat.h
    civ.h
    color.h
    downmixer.h
    fifo.h
    fir_table_calc.h
    hilbert90.h
    rtlsdr.h
    sdrplay.h
    setqrg.h
    ssbfft.h
    timing.h
    websdr.h
    wf_univ.h
    websocket/base64.h
    websocket/sha1.h
    websocket/websocketserver.h
)

include_directories(${CMAKE_SOURCE_DIR}/soapywebsdr)
include_directories(${CMAKE_SOURCE_DIR}/soapywebsdr/websocket)

message("SoapyWebSDR: ICN cxx flags: ${CMAKE_CXX_FLAGS}")
add_executable(SoapyWebSDR ${BIN_SOAPYWEBSDR_SOURCE} ${BIN_SOAPYWEBSDR_HEADERS})

target_link_libraries(SoapyWebSDR ${SoapyWebSDR_LIBRARIES})