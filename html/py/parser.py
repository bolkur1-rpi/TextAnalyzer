import sys
import re
import os
import mysql.connector
from mysql.connector import Error
import string
import random

name = sys.argv[1]
title = sys.argv[2]
check = sys.argv[3]

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

connection = create_connection("localhost", "root", "bolkur1", "textdb")



def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print("Query succ")
    except Error as e:
        print(f'Feilur "{e}" hendi')

def query_builder(filename, title, number_of_words, number_of_unique_words, id):
    q = "CALL createNewPaper(" + "'" + filename + "', " + str(title) + ', ' + str(number_of_words) + ', ' + str(number_of_unique_words) +  + str(id) + ");"
    return q



def id_query(connection, name):
    cursor = connection.cursor()
    try:
        id = cursor.callproc('getStudentIdByName', name)
        connection.commit()
        print("Query succ")
        return id
    except Error as e:
        print(f'Feilur "{e}" hendi')




def fileHandler(title, rname):
    file = open("/var/www/html/temp" + title)
    text = file.read()
    file.close
    file2 = open("/var/www/html/uploads/" + rname, "a")
    os.remove("/home/eg/" + title)
    for line in text:
        file2.write(line)

    return text


def randomizeName():
    rn = ""
    cset = string.ascii_uppercase + string.digits
    ctr = 10
    while(ctr > 0):
        rn += random.choice(cset)
        ctr -= 1

    return rn

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

def check(check, name):
    if(check == 0):
        create_user = "CALL createNewStudent(" + name + ");"
        execute_query(connection, create_user)




check(check, name)
id = id_query(name)
random_name = randomizeName()
text = fileHandler(title, random_name)
words = getWords(text)
word_amount = amount(words)
unique = uniqueWordAmount(words)
unique_amount = amount(unique)
add = query_builder(random_name, title, word_amount, unique_amount, id)
execute_query(connection, add)
connection.close()
