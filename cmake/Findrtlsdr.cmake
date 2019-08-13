# Find rtlsdr
# Find the native rtlsdr includes and library
#
#  RTLSDR_INCLUDES    - where to find rtl-sdr.h
#  RTLSDR_LIBRARIES   - List of libraries when using rtlsdr.
#  RTLSDR_FOUND       - True if rtlsdr found.

if (RTLSDR_INCLUDES)
    # Already in cache, be silent
    set (RTLSDR_FIND_QUIETLY TRUE)
endif (RTLSDR_INCLUDES)

find_path (RTLSDR_INCLUDES rtl-sdr.h)

find_library (RTLSDR_LIBRARIES NAMES rtlsdr)

# handle the QUIETLY and REQUIRED arguments and set RTLSDR_FOUND to TRUE if
# all listed variables are TRUE
include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (RTLSDR DEFAULT_MSG RTLSDR_LIBRARIES RTLSDR_INCLUDES)

mark_as_advanced (RTLSDR_LIBRARIES RTLSDR_INCLUDES)