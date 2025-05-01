# onboard-gcp-alloydb-postgresql

Onboard Google ALloyDB for PostgreSQL to DSF Hub.

## Notes
There are five prerequisites for using this module:
1. The user or service account running the module will require the AlloyDB Admin role for configuring the cluster(s) including modifying database flags.
2. A Google Service Account with permissions to read from PubSub subscriptions.
3. Data Access logs to be enabled for the AlloyDB API service in your GCP project, including "Admin Read", "Data Read" and "Data Write" permissions.
4. A Google logging sink, PubSub topic, and PubSub subscription in addition to a GCP PUBSUB asset in DSF Hub.
5. A method to create the 'pgaudit' extension on the postgres instance.

See the corresponding example for more details.