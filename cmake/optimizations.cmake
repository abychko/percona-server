# Alexey Bychko <abychko@gmail.com> Wed Sep 10 12:32:17 EEST 2025
#
#
OPTION(FORCE_OPTIMIZATION "Tune compiler/binaries for speed" OFF)

IF(CMAKE_BUILD_TYPE_UPPER STREQUAL "DEBUG")
	MESSAGE(WARNING "==>> Cannot set optimization for debug build!")
	RETURN()
ENDIF()

IF(FORCE_OPTIMIZATION)
	FOREACH (LANG C CXX)
		FOREACH(OPT "-floop-block -fgraphite-identity -floop-parallelize-all " "-march=native -mtune=generic ")
			STRING_PREPEND(CMAKE_${LANG}_FLAGS ${OPT})
		ENDFOREACH()
	ENDFOREACH()
ENDIF()

