*** Settings ***
#Library           ./MongoDBLibrary.py
Library            ./mongo.py

*** Variables ***
${user}=          crttest
${pw}=            mongodb
${cluster}=       crtcluster.yoglmny.mongodb.net/
${dbname}=        crtdatabase


*** Test Cases ***
Test
    Connect  uri=mongodb+srv://${user}:${pw}@${cluster}    dbname=${dbname}
    ${records}=  Find Records  crtcollection     Name  John  
    Disconnect

