import sublime_plugin
import sublime


class AutoComplete(sublime_plugin.ViewEventListener):

    @classmethod
    def is_applicable(cls, settings):
        if not settings:
            return False
        syntax = settings.get("syntax", None)
        if not syntax:
            return False
        return syntax.endswith("CMake.sublime-syntax")

    def on_query_completions(self, prefix, locations):
        for point in locations:
            if not self.view.match_selector(point, "meta.text-substitution"):
                return None
        selector = "variable.other.readwrite.assignment"
        regions = self.view.find_by_selector(selector)
        earliest_row, _ = self.view.rowcol(locations[0])
        result = []
        for region in regions:
            variable_name = self.view.substr(region)
            if variable_name:
                current_row, _ = self.view.rowcol(region.a)
                if current_row >= earliest_row:
                    break
                informational = '%s\tline %i' % (variable_name,
                                                 current_row + 1)
                result.append([informational, variable_name])
        result.extend(self.__class__.BUILTINS)
        return (result,
                sublime.INHIBIT_WORD_COMPLETIONS |
                sublime.INHIBIT_EXPLICIT_COMPLETIONS)

    BUILTINS = [
        ["CMAKE_BINARY_DIR\tbuiltin", "CMAKE_BINARY_DIR"],
        ["CMAKE_COMMAND\tbuiltin", "CMAKE_COMMAND"],
        ["CMAKE_CURRENT_BINARY_DIR\tbuiltin", "CMAKE_CURRENT_BINARY_DIR"],
        ["CMAKE_CURRENT_LIST_FILE\tbuiltin", "CMAKE_CURRENT_LIST_FILE"],
        ["CMAKE_CURRENT_LIST_DIR\tbuiltin", "CMAKE_CURRENT_LIST_DIR"],
        ["CMAKE_CURRENT_LIST_LINE\tbuiltin", "CMAKE_CURRENT_LIST_LINE"],
        ["CMAKE_CURRENT_SOURCE_DIR\tbuiltin", "CMAKE_CURRENT_SOURCE_DIR"],
        ["CMAKE_FILES_DIRECTORY\tbuiltin", "CMAKE_FILES_DIRECTORY"],
        ["CMAKE_MODULE_PATH\tbuiltin", "CMAKE_MODULE_PATH"],
        ["CMAKE_ROOT\tbuiltin", "CMAKE_ROOT"],
        ["CMAKE_SOURCE_DIR\tbuiltin", "CMAKE_SOURCE_DIR"],
        ["EXECUTABLE_OUTPUT_PATH\tbuiltin", "EXECUTABLE_OUTPUT_PATH"],
        ["LIBRARY_OUTPUT_PATH\tbuiltin", "LIBRARY_OUTPUT_PATH"],
        ["PROJECT_NAME\tbuiltin", "PROJECT_NAME"],
        ["CMAKE_PROJECT_NAME\tbuiltin", "CMAKE_PROJECT_NAME"],
        ["PROJECT_BINARY_DIR\tbuiltin", "PROJECT_BINARY_DIR"],
        ["PROJECT_SOURCE_DIR\tbuiltin", "PROJECT_SOURCE_DIR"],
        ["CMAKE_MAJOR_VERSION\tbuiltin", "CMAKE_MAJOR_VERSION"],
        ["CMAKE_MINOR_VERSION\tbuiltin", "CMAKE_MINOR_VERSION"],
        ["CMAKE_PATCH_VERSION\tbuiltin", "CMAKE_PATCH_VERSION"],
        ["CMAKE_TWEAK_VERSION\tbuiltin", "CMAKE_TWEAK_VERSION"],
        ["CMAKE_VERSION\tbuiltin", "CMAKE_VERSION"],
        ["CMAKE_SYSTEM\tbuiltin", "CMAKE_SYSTEM"],
        ["CMAKE_SYSTEM_NAME\tbuiltin", "CMAKE_SYSTEM_NAME"],
        ["CMAKE_SYSTEM_VERSION\tbuiltin", "CMAKE_SYSTEM_VERSION"],
        ["CMAKE_SYSTEM_PROCESSOR\tbuiltin", "CMAKE_SYSTEM_PROCESSOR"],
        ["CMAKE_GENERATOR\tbuiltin", "CMAKE_GENERATOR"],
        ["UNIX\tbuiltin", "UNIX"],
        ["WIN32\tbuiltin", "WIN32"],
        ["APPLE\tbuiltin", "APPLE"],
        ["MINGW\tbuiltin", "MINGW"],
        ["MSYS\tbuiltin", "MSYS"],
        ["CYGWIN\tbuiltin", "CYGWIN"],
        ["BORLAND\tbuiltin", "BORLAND"],
        ["WATCOM\tbuiltin", "WATCOM"],
        ["MSVC\tbuiltin", "MSVC"],
        ["CMAKE_C_COMPILER_ID\tbuiltin", "CMAKE_C_COMPILER_ID"],
        ["CMAKE_CXX_COMPILER_ID\tbuiltin", "CMAKE_CXX_COMPILER_ID"],
        ["CMAKE_COMPILER_IS_GNUCC\tbuiltin", "CMAKE_COMPILER_IS_GNUCC"],
        ["CMAKE_COMPILER_IS_GNUCXX\tbuiltin", "CMAKE_COMPILER_IS_GNUCXX"],
        ["BUILD_SHARED_LIBS\tbuiltin", "BUILD_SHARED_LIBS"],
        ["CMAKE_AR\tbuiltin", "CMAKE_AR"],
        ["CMAKE_BUILD_TYPE\tbuiltin", "CMAKE_BUILD_TYPE"],
        ["CMAKE_CONFIGURATION_TYPES\tbuiltin", "CMAKE_CONFIGURATION_TYPES"],
        ["CMAKE_C_COMPILER\tbuiltin", "CMAKE_C_COMPILER"],
        ["CMAKE_C_FLAGS\tbuiltin", "CMAKE_C_FLAGS"],
        ["CMAKE_C_FLAGS_DEBUG\tbuiltin", "CMAKE_C_FLAGS_DEBUG"],
        ["CMAKE_C_FLAGS_RELEASE\tbuiltin", "CMAKE_C_FLAGS_RELEASE"],
        ["CMAKE_C_FLAGS_RELWITHDEBINFO\tbuiltin",
            "CMAKE_C_FLAGS_RELWITHDEBINFO"],
        ["CMAKE_C_OUTPUT_EXTENSION\tbuiltin", "CMAKE_C_OUTPUT_EXTENSION"],
        ["CMAKE_CFG_INTDIR\tbuiltin", "CMAKE_CFG_INTDIR"],
        ["CMAKE_CXX_COMPILER\tbuiltin", "CMAKE_CXX_COMPILER"],
        ["CMAKE_CXX_FLAGS\tbuiltin", "CMAKE_CXX_FLAGS"],
        ["CMAKE_CXX_FLAGS_DEBUG\tbuiltin", "CMAKE_CXX_FLAGS_DEBUG"],
        ["CMAKE_CXX_FLAGS_RELEASE\tbuiltin", "CMAKE_CXX_FLAGS_RELEASE"],
        ["CMAKE_CXX_FLAGS_RELWITHDEBINFO\tbuiltin",
            "CMAKE_CXX_FLAGS_RELWITHDEBINFO"],
        ["CMAKE_RANLIB\tbuiltin", "CMAKE_RANLIB"],
        ["CMAKE_SHARED_LINKER_FLAGS\tbuiltin", "CMAKE_SHARED_LINKER_FLAGS"]
    ]
