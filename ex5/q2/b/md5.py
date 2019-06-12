#!/usr/bin/python3

#Output: <number>,<file-full-path>,<md5-of-the-file>

import os
import sys
import hashlib

direct = sys.argv[1]
count = 0

if len(sys.argv) != 2:
    print("wrong number of arguments")
    sys.exit(1)

elif not os.path.isdir(direct):
    print(str(sys.argv[1]) + " Is not a directory, please try again")
    sys.exit(1)

else:

    for root, dirs, files in os.walk(direct):
        for name in files:
            count=count+1
            print(str(count) + "," + os.path.join(root, name) + "," + hashlib.md5(os.path.join(root, name).encode("utf-8")).hexdigest())
        for name in dirs:
            count=count+1
            print(str(count) + "," + os.path.join(root, name) + "," + hashlib.md5(os.path.join(root, name).encode("utf-8")).hexdigest())

