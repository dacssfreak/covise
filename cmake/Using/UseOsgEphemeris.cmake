MACRO(USE_OSGEPHEMERIS)
  covise_find_package(OsgEphemeris)
  IF ((NOT OSGEPHEMERIS_FOUND) AND (${ARGC} LESS 1))
    USING_MESSAGE("Skipping because of missing OSGEPHEMERIS")
    RETURN()
  ENDIF((NOT OSGEPHEMERIS_FOUND) AND (${ARGC} LESS 1))
  IF(NOT OSGEPHEMERIS_USED AND OSGEPHEMERIS_FOUND)
    SET(OSGEPHEMERIS_USED TRUE)
    USE_OPENGL()
    INCLUDE_DIRECTORIES(${OSGEPHEMERIS_INCLUDE_DIR})
    SET(EXTRA_LIBS ${EXTRA_LIBS} ${OSGEPHEMERIS_LIBRARY})
  ENDIF()
ENDMACRO(USE_OSGEPHEMERIS)
