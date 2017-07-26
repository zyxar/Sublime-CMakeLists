import subprocess
import dicttoxml  # pip install dicttoxml
import os
from xml.dom.minidom import parseString

def main():
    commands = subprocess.check_output(["cmake", "--help-command-list"]) \
                         .decode("utf-8")                                \
                         .splitlines()
    existing_snippets = [ os.path.splitext(f)[0] for f in os.listdir("Snippets") ]
    new_commands = set(commands) - set(existing_snippets)
    if not new_commands:
        print("No new commands.")
        return
    for cmd in new_commands:
        print("New command:", cmd)
        xml1 = dicttoxml.dicttoxml({ 
            "description": "command", 
            "tabTrigger": cmd, 
            "scope": "source.cmake - meta.function-call.arguments - string - comment"},
            attr_type=False,
            root=False)
        xml2 = dicttoxml.dicttoxml({ 
            "content": cmd + "($0)" }, 
            attr_type=False, 
            cdata=True, 
            root=False)
        xml = b"<snippet>" + xml1 + xml2 + b"</snippet>"
        xml = parseString(xml).toprettyxml()
        xml = xml[len('<?xml version="1.0"?>') + 2:] # terrible hack, but works
        with open(os.path.join("Snippets", cmd + ".sublime-snippet"), "w") as f:
            f.write(xml)
    return 0

if __name__ == '__main__':
    exit(main())
