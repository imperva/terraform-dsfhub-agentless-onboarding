# onboard-gcp-postgresql

Onboard Cloud SQL for PostgreSQL to DSF Hub.

## Notes
There are three prerequisites for using this module:
1. A Google Service Account with permissions to read from PubSub subscriptions.
2. A Google logging sink, PubSub topic, and PubSub subscription in addition to a GCP PUBSUB asset in DSF Hub.
3. A method to create the 'pgaudit' extension on the postgres instance.

See the corresponding example for more details.
