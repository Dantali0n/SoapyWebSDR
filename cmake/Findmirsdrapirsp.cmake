# Find mirsdrapirsp
# Find the native mirsdrapirsp includes and library
#
#  MIRSDRAPIRSP_INCLUDES    - where to find mirsdrapi-rsp.h
#  MIRSDRAPIRSP_LIBRARIES   - List of libraries when using mirsdrapi-rsp.
#  MIRSDRAPIRSP_FOUND       - True if mirsdrapirsp found.

if (MIRSDRAPIRSP_INCLUDES)
    # Already in cache, be silent
    set (MIRSDRAPIRSP_FIND_QUIETLY TRUE)
endif (MIRSDRAPIRSP_INCLUDES)

find_path (MIRSDRAPIRSP_INCLUDES mirsdrapi-rsp.h)

find_library (MIRSDRAPIRSP_LIBRARIES NAMES mirsdrapi-rsp)

# handle the QUIETLY and REQUIRED arguments and set MIRSDRAPIRSP_FOUND to TRUE if
# all listed variables are TRUE
include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (MIRSDRAPIRSP DEFAULT_MSG MIRSDRAPIRSP_LIBRARIES MIRSDRAPIRSP_INCLUDES)

mark_as_advanced (MIRSDRAPIRSP_LIBRARIES MIRSDRAPIRSP_INCLUDES)
