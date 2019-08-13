# Find asound
# Find the native asound includes and library
#
#  ASOUND_INCLUDES    - where to find asoundlib.h
#  ASOUND_LIBRARIES   - List of libraries when using sndfile.
#  ASOUND_FOUND       - True if asound found.

if (ASOUND_INCLUDES)
    # Already in cache, be silent
    set (ASOUND_FIND_QUIETLY TRUE)
endif (ASOUND_INCLUDES)

find_path (ASOUND_INCLUDES asoundlib.h)

find_library (ASOUND_LIBRARIES NAMES asound)

# handle the QUIETLY and REQUIRED arguments and set ASOUND_FOUND to TRUE if
# all listed variables are TRUE
include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (ASOUND DEFAULT_MSG ASOUND_LIBRARIES ASOUND_INCLUDES)

mark_as_advanced (ASOUND_LIBRARIES ASOUND_INCLUDES)