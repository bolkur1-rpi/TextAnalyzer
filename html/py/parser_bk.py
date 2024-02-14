from pathlib import Path
import sys
import re
#import mysql.connector
#import argparse

#parser = argparse.ArgumentParser()
#parser.add_argument("--name", required=True, type=str)
#parser.add_argument("--title", required=True, type=str)
#args = parser.parse_args()

#name = args.name
#title = args.title


name = sys.argv[1]
title = sys.argv[2]

file = open("/var/www/html/temp/" + title)

text = file.read()
file.close

file2 = open("/var/www/html/uploads/" + title,"w")

for line in text:
	file2.write(line)

paragraf = re.split(r"\n \n", text)
sentence = re.split(r"\.|\!|\?\:", text)
words = re.findall(r"\w+", text)

wordsnr = len(words)


unique = []
duplicate = []


for word in words:
    word = word.lower()
    if word not in unique and word not in duplicate:
        unique.append(word)
    elif word in unique:
        unique.remove(word)
        duplicate.append(word)

unique.sort()

uniquenr = len(unique)

for i in unique:
    print(i)

print("Number of unique words: " + str(len(unique)) + name + title)

#conn = mysql.connector.connect(user='root', password='bolkur1', host='localhost', database='textdb')

#cursor = conn.cursor()

#cursor.callproc(createNewPaper, args=(title, wordsnr, uniquenr, 2)

#conn.close()
#bl = open("/var/www/html/uploads/hetta.txt", "x")
#bl.write("her hendi okkurt")
#bl.write(name)
#bl.close()

