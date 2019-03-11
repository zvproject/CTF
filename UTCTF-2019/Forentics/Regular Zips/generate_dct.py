import rstr

with open("hint.txt") as f:
    string=f.read();
string=string[1:-1]
with open("dictionary.txt",'w') as f:
    for i in range(10000):
       answer=rstr.xeger(r''+string)
       f.write(str(answer)+"\n")

