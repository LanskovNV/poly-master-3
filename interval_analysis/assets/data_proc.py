#!/usr/bin/env python
"""Process txt to mat"""
import sys


if __name__ == "__main__":
    filename = sys.argv[1]

    with open(filename, "r") as f:
        lines = f.readlines()
        lines = [f"{line.strip()}\n" for line in lines]

    with open(filename, "w") as f:
        f.writelines(lines)
