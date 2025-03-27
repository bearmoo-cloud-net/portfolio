#!/bin/python
# Enter your code here. Read input from STDIN. Print output to STDOUT

import sys
import re
# Get the first input that will tell us how many phones numbers are we expecting.
# maybe use that to set an array.
# For each phone, check of its a validate number:
#  10 digits long
#  starts with 7, 8, or 9
#  If phone is valid, print YES, if not, print NO.
if __name__ == '__main__':
    a = int(input())
    i = 0
    phone_number = ['None'] * a
    phone_number = sys.stdin.readlines()

    for i in phone_number:
        if (len(i.strip()) == 10) and (re.match(r'^7|8|9', i.strip())):
            if re.findall(r'[A-Z]', i.strip()):
                print ("NO")
            else:
                print ("YES")
        else:
            print ("NO")
