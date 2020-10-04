import json
import subprocess


def main():
    commands = subprocess.check_output(["cmake", "--help-command-list"]).decode("utf-8").splitlines()
    completions = []
    for command in commands:
        completions.append({
            "trigger": "{}\tbuiltin".format(command),
            "contents": command
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
