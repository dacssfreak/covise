# - Find osgCal
# Find the alut includes and library
#
#  OSGEPHEMERIS_INCLUDE_DIR - Where to find osgEphemeris includes
#  OSGEPHEMERIS_LIBRARIES   - List of libraries when using osgEphemeris
#  OSGEPHEMERIS_FOUND       - True if osgEphemeris was found

IF(OSGEPHEMERIS_INCLUDE_DIR)
  SET(OSGEPHEMERIS_FIND_QUIETLY TRUE)
ENDIF(OSGEPHEMERIS_INCLUDE_DIR)

FIND_PATH(OSGEPHEMERIS_INCLUDE_DIR "osgEphemeris/EphemerisModel.h"
  PATHS
  $ENV{OSGEPHEMERIS_HOME}/include
  $ENV{EXTERNLIBS}/osgEphemeris/include
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local/include
  /usr/include
  /sw/include # Fink
  /opt/local/include # DarwinPorts
  /opt/csw/include # Blastwave
  /opt/include
  DOC "osgEphemeris - Headers"
)

SET(OSGEPHEMERIS_NAMES osgEphemeris)
SET(OSGEPHEMERIS_DBG_NAMES osgEphemerisd)

FIND_LIBRARY(OSGEPHEMERIS_LIBRARY NAMES ${OSGEPHEMERIS_NAMES}
  PATHS
  $ENV{OSGEPHEMERIS_HOME}
  $ENV{EXTERNLIBS}/osgEphemeris
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
  PATH_SUFFIXES lib lib64
  DOC "osgEphemeris - Library"
)

INCLUDE(FindPackageHandleStandardArgs)

IF(MSVC)
  # VisualStudio needs a debug version
  FIND_LIBRARY(OSGEPHEMERIS_LIBRARY_DEBUG NAMES ${OSGEPHEMERIS_DBG_NAMES}
    PATHS
    $ENV{OSGEPHEMERIS_HOME}/lib
    $ENV{EXTERNLIBS}/osgEphemeris/lib
    DOC "osgEphemeris - Library (Debug)"
  )
  
  IF(OSGEPHEMERIS_LIBRARY_DEBUG AND OSGEPHEMERIS_LIBRARY)
    SET(OSGEPHEMERIS_LIBRARIES optimized ${OSGEPHEMERIS_LIBRARY} debug ${OSGEPHEMERIS_LIBRARY_DEBUG})
  ENDIF(OSGEPHEMERIS_LIBRARY_DEBUG AND OSGEPHEMERIS_LIBRARY)

  FIND_PACKAGE_HANDLE_STANDARD_ARGS(OSGEPHEMERIS DEFAULT_MSG OSGEPHEMERIS_LIBRARY OSGEPHEMERIS_LIBRARY_DEBUG OSGEPHEMERIS_INCLUDE_DIR)

  MARK_AS_ADVANCED(OSGEPHEMERIS_LIBRARY OSGEPHEMERIS_LIBRARY_DEBUG OSGEPHEMERIS_INCLUDE_DIR)
  
ELSE(MSVC)
  # rest of the world
  SET(OSGEPHEMERIS_LIBRARIES ${OSGEPHEMERIS_LIBRARY})

  FIND_PACKAGE_HANDLE_STANDARD_ARGS(OSGEPHEMERIS DEFAULT_MSG OSGEPHEMERIS_LIBRARY OSGEPHEMERIS_INCLUDE_DIR)
  
  MARK_AS_ADVANCED(OSGEPHEMERIS_LIBRARY OSGEPHEMERIS_INCLUDE_DIR)
  
ENDIF(MSVC)

IF(OSGEPHEMERIS_FOUND)
  SET(OSGEPHEMERIS_INCLUDE_DIRS ${OSGEPHEMERIS_INCLUDE_DIR})
ENDIF(OSGEPHEMERIS_FOUND)