import random

if __name__ == "__main__":
    a = 8 * ['A1'] + 32 * ['A2']
    temp_a = []
    count = 0

    while 'A1' in a and 'A2' in a:
        for i in range(20):
            temp_a += [a[random.randint(0,39)]] * 2
            # print "A1: " + str(temp_a.count('A1'))
            # print "A2: " + str(temp_a.count('A2'))
        a = temp_a
        temp_a = []
        count += 1

    print "It took " + str(count) + " iterations to lose an allele."