# Find gd
# Find the native gd includes and library
#
#  GD_INCLUDES    - where to find gd.h
#  GD_LIBRARIES   - List of libraries when using gd.
#  GD_FOUND       - True if gd found.

if (GD_INCLUDES)
    # Already in cache, be silent
    set (GD_FIND_QUIETLY TRUE)
endif (GD_INCLUDES)

find_path (GD_INCLUDES gd.h)

find_library (GD_LIBRARIES NAMES gd)

# handle the QUIETLY and REQUIRED arguments and set GD_FOUND to TRUE if
# all listed variables are TRUE
include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (GD DEFAULT_MSG GD_LIBRARIES GD_INCLUDES)

mark_as_advanced (GD_LIBRARIES GD_INCLUDES)