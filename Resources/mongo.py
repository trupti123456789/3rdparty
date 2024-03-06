from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi
from robot.api import logger



class mongo():
    client = None
    db = None  # Add this line to store the database object

    def __init__(self):
        pass

    def connect(self, uri, dbname):
        if self.client is None:
            self.client = MongoClient(uri, server_api=ServerApi('1'))
        try:
            self.client.admin.command('ping')
            self.db = self.client[dbname]  # Select the database
            logger.info("Pinged your deployment. You successfully connected to MongoDB!", also_console=True)
        except Exception as e:
            logger.error(e)

    def disconnect(self):
        if self.client is not None:
            self.client.close()

    def find_records(self, collection_name, key, value):
        collection = self.db[collection_name]
        query = {key: value}
        documents = collection.find(query)
        results = []
        for doc in documents:
            results.append(doc)
            logger.info(str(doc), also_console=True)
        return results

    def insert_record(self, collection_name, data):
        collection = self.db[collection_name]
        result = collection.insert_one(data)
        logger.info(f"Inserted record with id {result.inserted_id}", also_console=True)
        return result.inserted_id

    def update_records(self, collection_name, query, new_values):
        collection = self.db[collection_name]
        result = collection.update_many(query, {'$set': new_values})
        logger.info(f"Updated {result.modified_count} records.", also_console=True)
        return result.modified_count

    def delete_records(self, collection_name, query):
        collection = self.db[collection_name]
        result = collection.delete_many(query)
        logger.info(f"Deleted {result.deleted_count} records.", also_console=True)
        return result.deleted_count    

    def delete_records2(self, collection_name, query):
        collection = self.db[collection_name]
        result = collection.delete_many(query)
        logger.info(f"Deleted {result.deleted_count} records.", also_console=True)
        return result.deleted_count    

    def Logical_oper_query(self, collection_name, query):
        collection = self.db[collection_name]
        documents = collection.find(query)
        results = []
        for doc in documents:
            results.append(doc)
            logger.info(str(doc), also_console=True)
        return results
