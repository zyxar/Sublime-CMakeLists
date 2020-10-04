# CMake

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/zyxar/Sublime-CMakeLists?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

* Simple auto-indentation support.
* Syntax highlighting for CMakeLists.txt files and `*.cmake` files, based on 
  [CMake 3.0][1].
* Syntax highlighting for CMakeCache.txt files.
* Syntax highlighting for `.h.in` and `.hpp.in` files.
* Basic snippets.
* Basic keybindings.

## Available Snippets

All (recent) built-in commands from cmake are provided as a basic snippet.

## Available Key Bindings

* Select a word, and press <kbd>$</kbd> to wrap the selection
  as a [variable substitution][3]. The newly inserted text will stay selected, 
  so that you can press the double-quotes character <kbd>"</kbd> to enclose the 
  selection in double-qoutes too. Press tab to get out of the selection if you 
  don't want double-quotes.
* Select a word, and press <kbd>ctrl</kbd><kbd>shift</kbd><kbd>,</kbd> to wrap 
  the selection as a [generator expression][2] with an argument.
* Select a word, and press <kbd>ctrl</kbd><kbd>shift</kbd><kbd>.</kbd> to wrap
  the selection as a [generator expression][2] without an argument.

[1]: https://cmake.org/cmake/help/v3.0/manual/cmake-language.7.html
[2]: https://cmake.org/cmake/help/v3.0/manual/cmake-generator-expressions.7.html
[3]: https://cmake.org/cmake/help/v3.0/manual/cmake-language.7.html#variable-references
