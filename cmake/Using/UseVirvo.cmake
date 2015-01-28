MACRO(USE_VIRVO)
  if (COVISE_USE_VIRVO)
  USE_BOOST()
  USE_FFMPEG()
  USE_GLEW()
  USE_JPEGTURBO(optional)
  covise_find_package(GDCM)
  if (GDCM_FOUND)
     include(${GDCM_USE_FILE})
     add_definitions(-DHAVE_GDCM)
  endif()
  IF(NOT VIRVO_USED)
    SET(VIRVO_USED TRUE)
    INCLUDE_DIRECTORIES($ENV{COVISEDIR}/src/3rdparty/deskvox/virvo)
    if (COVISE_VIRVO_LIBRARY)
       SET(EXTRA_LIBS ${EXTRA_LIBS} ${COVISE_VIRVO_LIBRARY})
    else()
       SET(EXTRA_LIBS ${EXTRA_LIBS} virvo)
    endif()
  ENDIF(NOT VIRVO_USED)
  endif()
ENDMACRO(USE_VIRVO)