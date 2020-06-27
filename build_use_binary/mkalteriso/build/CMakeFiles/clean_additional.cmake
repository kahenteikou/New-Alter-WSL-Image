# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "CMakeFiles/mkalteriso_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/mkalteriso_autogen.dir/ParseCache.txt"
  "mkalteriso_autogen"
  )
endif()
