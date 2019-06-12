#!/usr/bin/python3

import os
import sys

direct = sys.argv[1]

if len(sys.argv) != 2:
    print("wrong number of arguments")
    sys.exit(1)

elif not os.path.isdir(direct):
    print(str(sys.argv[1]) + " Is not a directory, please try again")
    sys.exit(1)

else:

    for root, dirs, files in os.walk(direct):
        for name in files:
            print(os.path.join(root, name))
        for name in dirs:
            print(os.path.join(root, name))
