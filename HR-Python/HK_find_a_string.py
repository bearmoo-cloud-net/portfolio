import re
#input of strings
#Get the length of its being searched.
#when indexing collect, if more than the search item, remove the biginning item in the string.

def count_substring(string, sub_string):
    my_string = ""
    my_search = sub_string
    count = 0
    for i in range(0, len(string)):
        my_string = my_string + string[i]
        if len(my_string) > len(sub_string):
            my_string = my_string[1:]
        if re.match(my_search, my_string):
            count = count + 1
    return count

if __name__ == '__main__':
    string = input().strip()
    sub_string = input().strip()
    
    count = count_substring(string, sub_string)
    print(count)
