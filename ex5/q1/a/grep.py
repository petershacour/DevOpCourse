#!/usr/bin/python3

file = open("file.txt", "r")

for line in file:
    words = line.split()
    if "test" in words:
        print(line)

file.close()
