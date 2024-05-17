*** Settings ***
Library                        ./mongo.py
#Library                       ./MongoDBLibrary.py

*** Variables ***
${user}=                       crttest
${pw}=                         mongodb
${cluster}=                    crtcluster.yoglmny.mongodb.net/
${DBNAME}=                     crtdatabase
${COLLECTION}=                 crtcollection

*** Test Cases ***
Connect To MongoDB And Perform Operations
    [Tags]        mongo
    # Connect to the database
    Connect                    uri=mongodb+srv://${USER}:${PW}@${CLUSTER}              dbname=${DBNAME}

    # Find records
    ${records}=                Find Records                ${COLLECTION}               Name                        John
    Log                        ${records}

    # Insert a new record
    ${new_record}=             Create Dictionary           Name=Jane                   Age=30
    ${inserted_id}=            Insert Record               ${COLLECTION}               ${new_record}
    Log                        Inserted record with ID: ${inserted_id}

    # Update records
    ${update_query}=           Create Dictionary           Name=Jane
    ${new_values}=             Create Dictionary           Age=31
    ${modified_count}=         Update Records              ${COLLECTION}               ${update_query}             ${new_values}
    Log                        Updated ${modified_count} records.

    # Delete records
    ${delete_query}=           Create Dictionary           Name=Jane
    ${deleted_count}=          Delete Records              ${COLLECTION}               ${delete_query}
    Log                        Deleted ${deleted_count} records.

    # Define the scores list outside the dictionary
    @{scores}=                 Create List                 85                          95                          75


    # Create a complex record with an array and nested object, passing the date as a string
    ${new_complex_record}=     Create Dictionary           name=Andrea Le              email=andrea_le@fake-mail.com                version=5
    ...                        scores=@{scores}

    # Insert the list in data
    ${inserted_id1}=           Insert Record               ${COLLECTION}               ${new_complex_record}
    Log                        Inserted complex record with ID: ${inserted_id1}


    #inserting date in data
    ${new_complex_record2}=    Create Dictionary           name=dev Le                 email=dev_le@fake-mail.com                   version=9
    ...                        dateCreated=2003-03-26

    ${inserted_id2}=           Insert Record               ${COLLECTION}               ${new_complex_record2}
    Log                        Inserted complex record with ID: ${inserted_id2}


    ##logical operation

    #Find record using Match by Multiple Conditions ($AND)
    ${query}=                  Evaluate                    {'$and': [{'scores': 75}, {'name': 'Greg Powell'}]}     json

    ${records}=                Logical Oper Query          ${COLLECTION}               ${query}

    # Find record using Match by Multiple Conditions ($OR)
    ${query1}=                 Evaluate                    {'$or': [{'version': 4}, {'name': 'Andrea Le'}]}
    ${records}=                Logical Oper Query          ${COLLECTION}               ${query1}

    # Find record using Match by Multiple Conditions ($NOT)
    ${query2}=                 Evaluate                    {'name': {'$not': {'$eq': 'Andrea Le'}}}
    ${records}=                Logical Oper Query          ${COLLECTION}               ${query2}

    # Find record using Match by Multiple Conditions ($lt)
    ${query3}=                 Evaluate                    {'version': {'$lte': 4}}
    ${records}=                Logical Oper Query          ${COLLECTION}               ${query3}

    # Find record using Match by Multiple Conditions ($lt,$gt)
    ${query4}=                 Evaluate                    {'scores': {'$elemMatch': {'$gt': 80, '$lt': 90}}}
    ${records}=                Logical Oper Query          ${COLLECTION}               ${query4}

    # Find record using Match by Multiple Conditions ($regex)
    ${query5}=                 Evaluate                    {'email': {'$regex': 'andrea_le'}}
    ${records}=                Logical Oper Query          ${COLLECTION}               ${query5}


    # Disconnect from the database
    Disconnect
