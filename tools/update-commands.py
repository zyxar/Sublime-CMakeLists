from __future__ import print_function
import yaml
import sys
import os

def main():
    parent = "scope:source.cmake#"
    with open(sys.argv[1], "r") as stream:
        commands_input = yaml.load(stream)
    main = []
    contexts = { "main": main}
    for command, keywords in commands_input.items():
        cmd_args = []
        cmd_args.append({ "meta_scope": "meta.function-call.arguments.cmake" })
        for keyword in keywords:
            cmd_args.append({ "match": r"\b" + keyword + r"\b", "scope": "variable.parameter.{}.cmake".format(keyword) })
        cmd_args.append({ "include": parent + "args-common" })
        contexts["{}-args".format(command)] = cmd_args
        main.append({
            "match": r"(?i)\b" + command + r"\b",
            "scope": "support.function.{}.cmake".format(command),
            "push": [
                { "meta_scope": "meta.function-call.cmake" },
                { "match": r"(?=\()", "set": [{ "match": r"\(", "scope": "punctuation.section.parens.begin.cmake", "set": "{}-args".format(command) }]},
                { "include": parent + "args-illegal-boilerplate" }
            ]
        })
    contexts["prototype"] = [{
        "include":parent + r"prototype"
    }]

    commands_output = {
        "scope": "commands.builtin.cmake",
        "hidden": True,
        "contexts": contexts
    }
    with open(sys.argv[2], "w") as stream:
        print("%YAML 1.2\n---", file=stream)
        print("# Automatically generated file -- do not edit!", file=stream)
        noalias_dumper = yaml.dumper.SafeDumper
        noalias_dumper.ignore_aliases = lambda self, data: True
        yaml.dump(commands_output, stream, 
                  default_flow_style=False, 
                  allow_unicode=True, 
                  default_style='',
                  Dumper=noalias_dumper)

    return 0

if __name__ == '__main__':
    exit(main())
