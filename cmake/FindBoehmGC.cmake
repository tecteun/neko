find_path(GC_INCLUDE_DIR gc.h
  PATH_SUFFIXES include)

find_library(GC_STATIC_LIBRARIES libgc.a
  PATH_SUFFIXES lib lib64)

find_library(GC_LIBRARIES gc
  PATH_SUFFIXES lib lib64)

if (NOT GC_LIBRARIES AND NOT GC_STATIC_LIBRARIES)
  message(FATAL_ERROR "BoehmGC not found in ${GC_ROOT}")
  set(GC_FOUND FALSE)
else()
  message(STATUS "GC: ${GC_INCLUDE_DIR}")
  message(STATUS "GC_LIBRARIES: ${GC_LIBRARIES}")
  message(STATUS "GC_STATIC_LIBRARIES: ${GC_STATIC_LIBRARIES}")
  set(GC_FOUND TRUE)
endif()

mark_as_advanced(
  GC_INCLUDE_DIR
  GC_LIBRARIES
  GC_STATIC
  GC_STATIC_FOUND
)