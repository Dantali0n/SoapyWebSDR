# Find sndfile
# Find the native m includes and library
#
#  SNDFILE_INCLUDES    - where to find sndfile.h
#  SNDFILE_LIBRARIES   - List of libraries when using sndfile.
#  SNDFILE_FOUND       - True if sndfile found.

if (SNDFILE_INCLUDES)
    # Already in cache, be silent
    set (SNDFILE_FIND_QUIETLY TRUE)
endif (SNDFILE_INCLUDES)

find_path (SNDFILE_INCLUDES sndfile.h)

find_library (SNDFILE_LIBRARIES NAMES sndfile)

# handle the QUIETLY and REQUIRED arguments and set GD_FOUND to TRUE if
# all listed variables are TRUE
include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (SNDFILE DEFAULT_MSG SNDFILE_LIBRARIES SNDFILE_INCLUDES)

mark_as_advanced (SNDFILE_LIBRARIES SNDFILE_INCLUDES)