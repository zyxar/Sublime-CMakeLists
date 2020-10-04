import json
import subprocess


def main():
    commands = subprocess.check_output(["cmake", "--help-command-list"]).decode("utf-8").splitlines()
    completions = []
    for command in commands:
        if command in ("function", "macro"):
            continue
        completions.append({
            "trigger": "{}\tbuiltin".format(command),
            "contents": "{}($0)".format(command)
        })
    completions.append({
        "trigger": "function\tbuiltin",
        "contents": "function(${1:name} ${2:arguments})\n\t${0:# function body}\nendfunction(${1:name})"
    })
    completions.append({
        "trigger": "macro\tbuiltin",
        "contents": "macro(${1:name} ${2:arguments})\n\t${0:# macro body}\nendmacro(${1:name})"
    })
    with open("CMake.sublime-completions", "w") as fp:
        json.dump(
            {
                "scope": "source.cmake - meta.function-call.arguments - string - comment",
                "completions": completions
            },
            fp,
            sort_keys=True,
            separators=(",", ":"),
            check_circular=False
        )

if __name__ == '__main__':
    main()
