#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import json
import subprocess
import os


def main():
    snippets = os.path.join(os.path.dirname(os.path.dirname(__file__)), "Snippets")
    specials = set()
    for file in os.listdir(snippets):
        stem, _ = os.path.splitext(file)
        stem = os.path.basename(stem)
        print("found special command", stem)
        specials.add(stem)
    commands = subprocess.check_output(["cmake", "--help-command-list"]).decode("utf-8").splitlines()
    completions = []
    for command in commands:
        if command in specials:
            print("skipping special command", command)
            continue
        completions.append({
            "trigger": "{}\tbuiltin".format(command),
            "contents": "{}($0)".format(command)
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
