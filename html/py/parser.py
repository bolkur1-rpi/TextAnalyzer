import sys
import re
import os
import mysql.connector
from mysql.connector import Error
import string
import random

name = sys.argv[1]
title = sys.argv[2]

def create_connection(host_name, user_name, user_password, db_name):
    connection = None
    try:
        connection = mysql.connector.connect(
            host = host_name,
            user = user_name,
            auth_plugin = "mysql_native_password",
            passwd = user_password,
            database = db_name
        )
        print('Connection to MySQL DB succesfullll')
    except Error as e:
        print(f"The Error '{e}' occured")
    return connection

# Used in Docker
file = open("../servername.txt")
text = file.read()
file.close
servername = text.strip()
connection = create_connection(servername, "root", "bolkur1", "textdb")

def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print("Query succ")
    except Error as e:
        print(f'Feilur "{e}" hendi')

def query_builder(filename, title, number_of_words, number_of_unique_words, sentence_amount, paragraph_amount, words_pr_sentence, sentence_pr_paragraph, name_of_student):
    q = "CALL createNewPaper(" + "'" + str(filename) + "', '" + str(title) + "', '" + str(number_of_words) + "', '" + str(number_of_unique_words) + "', '" + str(sentence_amount) + "', '" + str(paragraph_amount) + "', '" + str(words_pr_sentence) + "', '" + str(sentence_pr_paragraph) + "', '" + str(name_of_student) + "'" + ");"
    return q

def fileHandler(title, rname):
    file = open("/var/www/html/temp/" + title)
    text = file.read()
    file.close
    file2 = open("/var/www/html/uploads/" + rname + ".txt", "a")
    os.remove("/var/www/html/temp/" + title)
    for line in text:
        file2.write(line)

    return text

def randomizeName():
    rn = ""
    cset = string.ascii_uppercase
    ctr = 10
    while(ctr > 0):
        rn += random.choice(cset)
        ctr -= 1

    return str(rn)

def getWords(text):
    words = re.findall(r"\w+", text)
    return words

def amount(words):
    return len(words)

def uniqueWordAmount(words):
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
    return unique

def getParagraph(text):
    para = re.split("\n\n", text)
    return para

def getSentence(someText):
    sentence = re.split("\.", someText)
    return sentence

def average(some1, some2):
    return (some1 / some2)

random_name = randomizeName()
text = fileHandler(title, random_name)
words = getWords(text)
word_amount = amount(words)
unique = uniqueWordAmount(words)
unique_amount = amount(unique)
sentence = getSentence(text)
paragraph = getParagraph(text)
sentence_amount = amount(sentence)
paragraph_amount = amount(paragraph)
words_pr_sentence = average(word_amount, sentence_amount)
sentence_pr_paragraph = average(sentence_amount, paragraph_amount)
add = query_builder(random_name, title, word_amount, unique_amount, sentence_amount, paragraph_amount, words_pr_sentence, sentence_pr_paragraph, name)
execute_query(connection, add)
connection.close()
