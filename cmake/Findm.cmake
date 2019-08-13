# Find m
# Find the native m includes and library
#
#  M_INCLUDES    - where to find math.h
#  M_LIBRARIES   - List of libraries when using m.
#  M_FOUND       - True if m found.

if (M_INCLUDES)
    # Already in cache, be silent
    set (M_FIND_QUIETLY TRUE)
endif (M_INCLUDES)

find_path (M_INCLUDES math.h)

find_library (M_LIBRARIES NAMES m)

# handle the QUIETLY and REQUIRED arguments and set GD_FOUND to TRUE if
# all listed variables are TRUE
include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (M DEFAULT_MSG M_LIBRARIES M_INCLUDES)

mark_as_advanced (M_LIBRARIES M_INCLUDES)