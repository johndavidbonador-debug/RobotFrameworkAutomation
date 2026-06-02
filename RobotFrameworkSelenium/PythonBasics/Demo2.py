values = [1,2,"John",4,5] #sample of list
print(values[0]) #Array starts with 0
print(values[1:3]) #sample of how to print from first index to 3
values.insert(3, "David") #how to add values to array with specific position
print(values)
values.append(6) #insert value to array at the end
print(values)
values[2] = "JOHN" #sample of how to update array
print(values)
del values[5] #sample of how to delete in array
print(values)

#sample of Tuple, Tuple is same with list datatype but it is immutable or cannot be updated
val = (1,2,"Joh")
#val[2] = "JOHN"
print(val)

#Dictionary = is another list datatype but it is in pair value unlike array it is index
dic = {"a":2,4:"bcd","c":"Hello world"}
print(dic["a"])
print(dic[4])
print(dic["c"])

#sample of adding value to dictionary
dict = {}
dict["firsname"] = "John"
dict["lastname"] = "David"
print(dict)
