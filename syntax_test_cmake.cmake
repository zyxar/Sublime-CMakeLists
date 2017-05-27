# SYNTAX TEST "Packages/Sublime-CMakeLists/CMake.sublime-syntax"

# This is a comment
# <- comment.line punctuation
#^^^^^^^^^^^^^^^^^^ comment.line
#                  ^ - comment.line

# <- source


        # a comment on a non-zero column
#         ^ comment.line

FOREACH (item ${items})
# <- keyword.control
# ^ meta.function-call - meta.function-call.arguments
#      ^ meta.function-call - meta.function-call.arguments
#       ^ meta.function-call.arguments - meta.function-call.cmake
#                      ^ - meta.function-call
    BREAK()
    # <- meta.group.foreach
    # <- keyword.control
    # ^ meta.function-call - meta.function-call.arguments
    #    ^ meta.function-call.arguments - meta.function-call.cmake
    #      ^ - meta.function-call
endforeach     ()
# <- keyword.control
# ^ meta.function-call - meta.function-call.arguments
#           ^ meta.function-call - meta.function-call.arguments
#              ^ meta.function-call.arguments - meta.function-call.cmake
#                ^ - meta.function-call

foreach(item ${items})
# <- meta.function-call - meta.function-call.arguments
#      ^ meta.function-call.arguments - meta.function-call.cmake
#                     ^ - meta.function-call
  if()
  # <- meta.function-call - meta.function-call.arguments
  # ^ meta.function-call.arguments - meta.function-call.cmake
  #   ^ - meta.function-call
    break()
    # <- meta.function-call - meta.function-call.arguments
    #    ^ meta.function-call.arguments - meta.function-call.cmake
    #      ^ - meta.function-call
  endif  ()
  # <- meta.function-call - meta.function-call.arguments
  #    ^ meta.function-call - meta.function-call.arguments
  #      ^ meta.function-call.arguments - meta.function-call.cmake
  #        ^ - meta.function-call
endforeach()
# <- meta.function-call - meta.function-call.arguments
#         ^ meta.function-call.arguments - meta.function-call.cmake
#           ^ - meta.function-call

if(blah)
  myfunc(myargument)
elseif(bar)
  # ^ meta.function-call - meta.function-call.arguments
  #   ^ meta.function-call.arguments - meta.function-call.cmake
  #        ^ - meta.function-call
  myfunc(myargument)
elseif(baz)
  myfunc(myargument)
else(foo)
  myfunc(foo)
endif(blah)

if (NOT (${something} AND ${something_else}))
#  ^ punctuation.section.parens.begin
#       ^ punctuation.section.parens.begin
#                                          ^ punctuation.section.parens.end
#                                           ^ punctuation.section.parens.end

endif()
# <- keyword.control

ENDIF()
# <- invalid.illegal

EnDiF()
# <- invalid.illegal

set(foo BAR CACHE FILEPATH "some documentation" FORCE)

set(x "\! \@ \# \$ \% \& \* \( \) \a \b \c \d \e \f \g \h \i \j \k \l \m \n \o \p \q \r \s \t \u \v \w \x \y \z")
#      ^^ invalid.illegal.character.escape
#         ^^ constant.character.escape
#            ^^ constant.character.escape
#               ^^ constant.character.escape
#                  ^^ invalid.illegal.character.escape
#                        ^^ invalid.illegal.character.escape
#                           ^^ constant.character.escape
#                              ^^ constant.character.escape
#                                 ^^ invalid.illegal.character.escape
#                                    ^^ invalid.illegal.character.escape
#                                       ^^ invalid.illegal.character.escape
#                                          ^^ invalid.illegal.character.escape
#                                             ^^ invalid.illegal.character.escape
#                                                ^^ invalid.illegal.character.escape
#                                                                        ^^ constant.character.escape

cmake_minimum_required(VERSION 3.0)
#                     ^ punctuation.section.parens.begin
#                                 ^ punctuation.section.parens.end
#                      ^^^^^^^^^^^ meta.function-call.arguments
#         ^ variable.function

set(some_var "Hello, world!")
# ^ variable.function
#   ^ entity.name.tag
#            ^ string.quoted.double
#  ^ punctuation.section.parens.begin
#                           ^ punctuation.section.parens.end

set(var_with_quotes "This is a string with \"embedded\" quotes.")

message(STATUS "${var}")
#                      ^ punctuation.section.parens.end

set(blarg
    # A comment inbetween
#     ^ comment.line
    foobar)

set(FOO "${var_with_quotes}")

message(STATUS "The some_var variable has the value \"${some_var}\"")
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments
#       ^^^^^^ constant.language
#              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#                                                   ^^ constant.character.escape
#                                                     ^^ keyword.other.block.begin
#                                                       ^^^^^^^^ meta.text-substitution
#                                                               ^ keyword.other.block.end
#                                                                ^^ constant.character.escape

target_link_libraries(mytarget PUBLIC
        ${Boost_LIBRARIES}
        ThisSpansMultipleLines
        ButNoProblem
        )

set(asdf nested_vars_test some${var_inside_${anot${h}er_var}_and_moving_on}_even_further)
#  ^ punctuation.section.parens.begin
#                             ^^ keyword.other.block.begin
#                                          ^^ keyword.other.block.begin
#                                                          ^ keyword.other.block.end
#                                                                         ^ keyword.other.block.end

set(some_list "one;two;thre\;e")
#                 ^ punctuation.separator
#                     ^ punctuation.separator
#                          ^^ constant.character.escape

if("${somevar}" STREQUAL "something else" NOT_A_KEYWORD)
#^ keyword.control
#               ^ constant.language
#                                         ^ string - constant.language

elseif("${somevar}" STREQUAL whatever AND NOT ${another_var} VERSION_LESS 1.2.3)
#^^^ keyword.control

elseif  (STREQUALasdf sTREQUAL COMMAND ANDNOT AND NOT VERSION_GREATER TARGET)
#^^^ keyword.control
#        ^^^^^^^^^^^^ string.unquoted 
#                     ^^^^^^^^ string.unquoted 
#                              ^^^^^^^ constant
#                                      ^^^^^^ string
#                                             ^^^ constant
#                                                 ^^^ constant

endif   ()
#^^^^ keyword.control

target_include_directories(mytarget PUBLIC $sdf>)

foreach(item ${items})
    message(STATUS "The item is ${item}")
    message(WARNING "asdf")
    message(AUTHOR_WARNING "hello there")
    message(FATAL_ERROR "i have the high ground")
    message(DEPRECATION "it's treason then")
endforeach()

set(FOO "Hello, world!")

set(BAZ "${CMAKE_CXX_COMPILER}")

set(SOURCE_FILES
  main.cpp
  echo.cpp)

target_link_libraries(gintonic PUBLIC mylib)

set(BAR "Another")
# <- meta.function-call - meta.function-call.arguments
#  ^ meta.function-call.arguments - meta.function-call.cmake
#                 ^ - meta.function-call

if (NOT "${var_with_quotes}" MATCHES [==[[A-Za-z]\d+]==] AND NOT )
#                                        ^ string.regexp
endif()

if ($ENV{LD_LIBRARY_PATH} STREQUAL /usr/local/lib)
#   ^^^^^ keyword.other.block.begin
#                                  ^^^^^^^^^^^^^^ string.unquoted
endif()

include(AddFileDependencies RESULT_VARIABLE MY_VAR OPTIONAL)
# ^ keyword.control.import
#                           ^ constant.language
#                                           ^ entity.name.tag
#                                                     ^ constant.language
include(CMakeParseArguments NO_POLICY_SCOPE)
# ^ keyword.control.import
#                           ^ constant.language

  install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/LLVMConfig
#                                                   ^ string.unquoted
#                                                    ^ - string.unquoted
    ${llvm_cmake_builddir}/LLVMConfigVersion
#                                          ^ string.unquoted
#                                           ^ - string.unquoted
    LLVM-Config
#   ^ string.unquoted
#              ^ - string.unquoted
    DESTINATION ${LLVM_INSTALL_PACKAGE_DIR}
#   ^ constant.language
    COMPONENT cmake-exports)
#   ^ constant.language
#             ^ string.unquoted

function(llvm_replace_compiler_option var old new)
  # Replaces a compiler option or switch `old' in `var' by `new'.
  # If `old' is not in `var', appends `new' to `var'.
  # Example: llvm_replace_compiler_option(CMAKE_CXX_FLAGS_RELEASE "-O3" "-O2")
  # If the option already is on the variable, don't add it:
  if( "${${var}}" MATCHES "(^| )${new}($| )" )
  # <- meta.function-call - meta.function-call.arguments
  # ^ meta.function-call.arguments - meta.function-call.cmake
  #                                           ^ - meta.function-call
    set(n "")
  else()
  # <- meta.function-call - meta.function-call.arguments
  #   ^ meta.function-call.arguments - meta.function-call.cmake
  #     ^ - meta.function-call
    set(n "${new}")
  endif()
  # <- meta.function-call - meta.function-call.arguments
  #    ^ meta.function-call.arguments - meta.function-call.cmake
  #      ^ - meta.function-call
  if( "${${var}}" MATCHES "(^| )${old}($| )" )
    string( REGEX REPLACE "(^| )${old}($| )" " ${n} " ${var} "${${var}}" )
  else()
    set( ${var} "${${var}} ${n}" )
    # <- variable.function
    #  ^ punctuation
    #    ^^ keyword.other.block
    #      ^^^ meta.text-substitution variable
    #         ^ keyword.other.block
    #          ^ meta.function-call.arguments
    #           ^ punctuation
    #            ^^^^ keyword.other.block
    #                ^^^ string.quoted.double meta.text-substitution meta.text-substitution variable
    #                   ^^ keyword.other.block
    #                     ^ meta.function-call.arguments string.quoted.double
    #                     
  endif()
  # <- keyword.control
  set( ${var} "${${var}}" PARENT_SCOPE )
endfunction(llvm_replace_compiler_option)

# Generate LLVMConfig for the install tree.
set(LLVM_CONFIG_CODE "
# Compute the installation prefix from this LLVMConfig file location.
get_filename_component(LLVM_INSTALL_PREFIX \"\${CMAKE_CURRENT_LIST_FILE}\" PATH)")
# Construct the proper number of get_filename_component(... PATH)
# calls to compute the installation prefix.
string(REGEX REPLACE "/" ";" _count "${LLVM_INSTALL_PACKAGE_DIR}")
foreach(p ${_count})
# <- meta.function-call - meta.function-call.arguments keyword.control
#      ^ meta.function-call.arguments - meta.function-call.cmake
#                   ^ - meta.function-call
  set(LLVM_CONFIG_CODE "${LLVM_CONFIG_CODE}
get_filename_component(LLVM_INSTALL_PREFIX \"\${LLVM_INSTALL_PREFIX}\" PATH)")
# <- string.quoted.double - variable.function
endforeach(p)
# <- meta.function-call - meta.function-call.arguments keyword.control
#         ^ meta.function-call.arguments - meta.function-call.cmake
#            ^ - meta.function-call
set(LLVM_CONFIG_INCLUDE_DIRS "\${LLVM_INSTALL_PREFIX}/include")
set(LLVM_CONFIG_LIBRARY_DIRS "\${LLVM_INSTALL_PREFIX}/lib\${LLVM_LIBDIR_SUFFIX}")
set(LLVM_CONFIG_CMAKE_DIR "\${LLVM_INSTALL_PREFIX}/${LLVM_INSTALL_PACKAGE_DIR}")
#                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
#                          ^^ constant.character.escape
#                                                  ^^ keyword.other.block.begin
#                                                                            ^ keyword.other.block.end
set(LLVM_CONFIG_BINARY_DIR "\${LLVM_INSTALL_PREFIX}")
#   ^ entity.name
#                           ^^ constant.character.escape
#                             ^ - keyword.other.block.begin
#                                                 ^ - keyword.other.block.end
set(LLVM_CONFIG_TOOLS_BINARY_DIR "\${LLVM_INSTALL_PREFIX}/bin")
set(LLVM_CONFIG_EXPORTS_FILE "\${LLVM_CMAKE_DIR}/LLVMExports")
set(LLVM_CONFIG_EXPORTS "${LLVM_EXPORTS}")
configure_file(
  LLVMConfig.in
  ${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/LLVMConfig
  @ONLY)
# ^^^^^ string.unquoted

target_include_directories(module PUBLIC $<CMAKE_COMPILER_ID>)
# ^^^^^^^^^^^^^^^^^^^^^^^^ variable.function
#                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments
#                         ^ punctuation.section.parens.begin
#                          ^^^^^^ string.unquoted
#                                 ^^^^^^ constant.language
#                                        ^^ keyword.other.block.begin
#                                          ^^^^^^^^^^^^^^^^^ meta.generator-expression
#                                                           ^ keyword.other.block.end
#                                                            ^ punctuation.section.parens.end


while (${var})
# <- keyword.control
# <- meta.function-call - meta.function-call.arguments
#    ^ meta.function-call
#     ^ meta.function-call.arguments - meta.function-call.cmake
#             ^ - meta.function-call
  myfunc(mytarget NAMED_ARG some_value)
endwhile(${var})
#^^^^^^^ keyword.control

set(TGT_PATH $<TARGET_FILE:tgt1>)
#            ^^ meta.generator-expression

if(NOT (CMAKE_VERSION VERSION_LESS 3.0))  # CMake >= 3.0
  # Build an interface library target:
  add_library(module INTERFACE)
  target_include_directories(module INTERFACE $<BUILD_INTERFACE:${PYBIND11_INCLUDE_DIR}>
#                                               ^^^^^^^^^^^^^^^ variable
#                                                              ^ punctuation.definition.separator
#                                                               ^^ keyword.other.block.begin
#                                                                 ^^^^^^^^^^^^^^^^^^^^ variable
#                                                                                     ^^ keyword.other.block.end
                                              $<BUILD_INTERFACE:${PYTHON_INCLUDE_DIRS}>
                                              $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
  if(WIN32 OR CYGWIN)
    target_link_libraries(module INTERFACE $<BUILD_INTERFACE:${PYTHON_LIBRARIES}>)
  elseif(APPLE)
    target_link_libraries(module INTERFACE "-undefined dynamic_lookup")
  endif()
  target_compile_options(module INTERFACE $<BUILD_INTERFACE:${PYBIND11_CPP_STANDARD}>)

  add_library(pybind11::module #[[new style bracket comments!]] ALIAS module)
#                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.block
#                                                               ^^^^^ constant.language
#                                                                     ^^^^^^ string.unquoted
#                                                                           ^ punctuation.section.parens.end
                                              
endif()

target_include_directories(module INTERFACE $<BUILD_INTERFACE:hello:world>)
#                                                                  ^ invalid.illegal

#[=[

  the following [[ snippet of text ]] should do nothing

    special

              in                                 [==[ not even this one ]==]

                        particular

]=] # and this is where a regular line comment starts 
# ^ comment.block
#   ^ comment.line

add_executable(hel#lo main.cpp)
#             ^ meta.function-call.arguments
#                 ^ comment.line - string.unquoted
    main.cpp)
#   ^^^^^^^^ meta.function-call.arguments
#           ^ punctuation.section.parens.end

add_executable(hel#[[lo main.cpp]] main.cpp)
#             ^ meta.function-call.arguments
#                 ^ comment.block - string.unquoted
#                                  ^^^^^^^^ meta.function-call.arguments string.unquoted
#                                          ^ punctuation.section.parens.end

foreach(arg
    NoSpace
    Escaped\ Space
#   ^^^^^^^^^^^^^^ string.unquoted
    This;Divides;Into;Five;Arguments
#       ^ punctuation.separator
#               ^ punctuation.separator
#                    ^ punctuation.separator
#                         ^ punctuation.separator
    Escaped\;Semicolon
#   ^^^^^^^^^^^^^^^^^^ string.unquoted
    )
  message("${arg}")
endforeach()

add_custom_target(ClaraDeploy
    COMMAND
        ${CMAKE_COMMAND} 
            -D VERSION=${PROJECT_VERSION} 
#              ^^^^^^^^ string.unquoted
            -D SUBLIME_PLATFORM_EXT=${SUBLIME_PLATFORM_EXT} 
#              ^^^^^^^^^^^^^^^^^^^^^ string.unquoted
            -D ZIPFILE="${Clara_tar_output}" 
#              ^^^^^^^^string.unquoted
            -P "${CMAKE_CURRENT_SOURCE_DIR}/Deploy"
#              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double
    DEPENDS
        ClaraPackage
    COMMENT
        "Deploying Clara"
    )

set(bedtime_story [=[
[1] Non eram ${nescius}, \Brute, \cum, \q\u\a\e \s\u\m\m\i\s\ \i\n\g\e\n\i\i\s
exquisitaque doctrina "${philosophi}" Graeco sermone tractavissent, ea Latinis
litteris mandaremus, fore ut hic noster labor in varias reprehensiones
incurreret. [[ x ]] nam quibusdam, et iis quidem non admodum indoctis, totum hoc
displicet philosophari. ]=])
#^^^^^^^^^^^^^^^^^^^^^^^^^^ string.raw
#                       ^^^ punctuation.definition.string.end
#                          ^ punctuation.section.parens.end                                                                 

set_target_properties(gintonic PROPERTIES CXX_STANDARD 14)
#  ^ meta.function-call variable.function
#                     ^ string.unquoted
#                              ^ constant.language
#                                         ^ constant.language
#                                                      ^ string.unquoted

macro(Hello var1 var2)
#     ^ entity.name.function

endmacro()
# <- variable.function
