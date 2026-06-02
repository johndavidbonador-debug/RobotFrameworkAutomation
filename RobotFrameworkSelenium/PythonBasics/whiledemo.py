it = 10

while it > 1:
    if it != 3:
        print(it)
    it = it - 1

print('while loop execution is done')

while it > 1:
    if it == 3:
        break
    print(it)

print('Break is activated')