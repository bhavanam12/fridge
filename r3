import csv

with open("trainingexamples.csv") as f:
    csv_file = csv.reader(f)
    data = list(csv_file)

print('*******Data*******')
print(data)

specific = data[1][:-1]
print('*******specific*******')
print(specific)

general = [['?' for i in range(len(specific))] for j in range(len(specific))]
print('*******General*******')
print(general)

for i in data:
    if i[-1] == "Yes":
        print("*****Inside YES*****")
        for j in range(len(specific)):
            if i[j] != specific[j]:
                specific[j] = "?"
                general[j][j] = "?"
    elif i[-1] == "No":
        print("*****Inside NO*****")
        for j in range(len(specific)):
            if i[j] != specific[j]:
                general[j][j] = specific[j]
                print(j)
                print("******general[j][j]*******" + general[j][j])
            else:
                general[j][j] = "?"

        print("\nStep " + str(data.index(i) + 1) + " of Candidate Elimination Algorithm")
        print(specific)
        print(general)

gh = []  # gh = general Hypothesis
for i in general:
    for j in i:
        if j != '?':
            gh.append(i)
            break

print("\nFinal Specific hypothesis:\n", specific)
print("\nFinal General hypothesis:\n", gh)


            OUTPUT:Final Specific hypothesis:
['Sunny', 'Warm', '?', 'Strong', '?', '?']
Final General hypothesis:
[['Sunny', '?', '?', '?', '?', '?'], ['?', 'Warm', '?', '?', '?', '?']
