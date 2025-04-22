def average(array):
    # your code goes here
    new_arrary = set(array)
    return sum(new_arrary) / len(new_arrary)

if __name__ == '__main__':
    n = int(input())
    arr = list(map(int, input().split()))
    result = average(arr)
    print(result)
