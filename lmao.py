#!/usr/bin/env python3

import pathlib

self = pathlib.Path(__file__).resolve()

vars = {
    "a": None,
    "b": None,
    "c": None,
}


def lmao():
    newlines = []
    with open(self, "r") as f:
        lines = f.readlines()

    start = False
    for line in lines:
        if line.startswith("vars = {"):
            start = True
        elif line.startswith("}") and start:
            newlines.append(f"vars = {repr(vars)}\n")
            start = False
        elif not start:
            newlines.append(line)
        else:
            continue
    with open(self, "w") as f:
        f.writelines(newlines)


def init_vars():
    for k, v in vars.items():
        if v is None:
            v = input(f"{k}: ")
            vars[k] = v
    lmao()


if __name__ == "__main__":
    init_vars()
    print(vars)
