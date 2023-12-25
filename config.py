#!/usr/bin/env python3

import re
import pathlib


secrets = pathlib.Path(__file__).parent / "secrets.sh"
text = secrets.read_text()
newlines = []
pattern = r'(^[^#].*?[A-Za-z_]+)="([^"]*)".*$'

for line in text.splitlines():
    matches = re.findall(pattern, line)
    if not matches:
        newlines.append(line + "\n")
        continue
    for match in matches:
        key = match[0]
        value = match[1]

        if len(value) == 0:
            value = input(f"provide a value for variable {key}: ")
        newlines.append(f'{key}="{value}"\n')

secrets.write_text("".join(newlines))
