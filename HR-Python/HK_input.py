# Enter your code here. Read input from STDIN. Print output to STDOUT
if __name__ == '__main__':
    n = input()
    t = input()
    new_arrary = n.split()
    x = int(new_arrary[0])
    if (eval(t)) == int(new_arrary[1]):
        print ("True")
    else:
        print ("False")
