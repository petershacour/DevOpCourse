#!/usr/bin/python3

import sys

if len(sys.argv) != 3 :
    print("Wrong number of arguments")
    sys.exit(1)


word = sys.argv[1]
filep = sys.argv[2]

file = open(filep, "r")

for line in file:
    words = line.split()
    if word in words:
        print(line)

file.close()

