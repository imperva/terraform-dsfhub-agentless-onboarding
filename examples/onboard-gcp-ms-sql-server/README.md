# Onboard Google Cloud SQL for SQL Server with Storage Bucket
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Cloud-SQL-for-SQL-Server-with-Storage-Bucket-Onboarding-Steps_48367631.html).

This example creates 'dsfhub' and 'google' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)
- [google](https://registry.terraform.io/providers/hashicorp/google/latest/docs)

## Prerequisites
### Account Asset Permissions
A Google Service Account will need to be created with permissions to read from GCS buckets, and a corresponding GCP cloud account asset will need to be onboarded to DSF. This can be done via the ``google-service-account-dsf`` module. Depending on the authentication mechanism chosen, the service account will either need to be attached to a GCP Compute Engine instance or the service account's credentials file will need to be copied to your Agentless Gateway.

### Google Cloud Storage Bucket
A Google Cloud Storage Bucket will need to created to contain the audit logs from the SQL Server instances, and it will need to have a corresponding asset onboarded to DSF. This prerequisite is handled by the ``onboard-gcp-cloud-storage-bucket`` module.

### Database Configuration
Part of the onboarding process involves connecting to your GCP SQL Server instance and running SQL commands to create an audit policy. This module includes an example for how to connect to the instance from your local machine and create it. 

**Note:** This example requires the ``sqlcmd`` client to be installed, as well as for the newly created GCP SQL Server instance to be accessible from your local machine. 

