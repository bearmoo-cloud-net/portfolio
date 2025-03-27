#!/bin/python

# Given an integer, , perform the following conditional actions:
# If  is odd, print Weird
# If  is even and in the inclusive range of  to , print Not Weird
# If  is even and in the inclusive range of  to , print Weird
# If  is even and greater than , print Not Weird

import math
import os
import random
import re
import sys


def isOdd(isOdd):
  return isOdd % 2 == 0

if __name__ == '__main__':
    n = int(input().strip())
    if isOdd(n):
      if (n >= 2) and (n <= 6):
        print ("Not Weird")
      if (n >= 6) and (n <= 20):
        print ("Weird")
      if (n > 20):
        print ("Not Weird")
    else:
      print ("Weird")

