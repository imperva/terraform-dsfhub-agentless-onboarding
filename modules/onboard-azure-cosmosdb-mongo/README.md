# onboard-azure-cosmosdb-mongo
Onboard Azure Cosmos DB API for MongoDB to DSF Hub.

## Notes
There are two prerequisites for using this module:
1. An Azure Event Hub Namespace and Event Hub. 
2. An Azure Storage Account and Container. This is used by DSF to store a marker which keeps track of what data in the Event Hub has been consumed.

These can be created along with an AZURE EVENTHUB asset via the ``onboard-azure-eventhub`` module.

See the corresponding example for more details.
