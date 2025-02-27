# Onboard Google Cloud SQL for PostgreSQL example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Cloud-SQL-for-PostgreSQL-Onboarding-Steps_48367600.html).

This example creates 'dsfhub' and 'google' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)
- [google](https://registry.terraform.io/providers/hashicorp/google/latest/docs)

## Prerequisites
### Service Account
A Google Service Account will need to be created with permissions to read from PubSub subscriptions. This can be done via the ``google-service-account-dsf`` module. Depending on the authentication mechanism chosen, the service account will either need to be attached to a GCP Compute Engine instance or the service account's credentials file will need to be copied to your Agentless Gateway.

### Data Access Audit Logs
Data Access audit logs should be enabled for the Cloud SQL API service in your GCP project, including "Admin Read", "Data Read" and "Data Write" permissions. For more information and instructions for enabling them, see [Cloud SQL for PostgreSQL audit logging](https://cloud.google.com/sql/docs/postgres/audit-logging) and [Enable Data Access audit logs](https://cloud.google.com/logging/docs/audit/configure-data-access). While this may be configured via Terraform using the [google_project_iam_audit_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_audit_config) resource, it is not recommended due to the risk of inadvertently locking yourself out of your GCP project.

### Google PubSub Subscription
A Google logging sink, PubSub topic, and PubSub subscription in addition to a GCP PUBSUB asset in DSF will need to be created in advance. This prerequisite is handled by the ``onboard-gcp-pubsub`` module.

### Database Configuration
Part of the onboarding process involves connecting to your Google PostgreSQL instance and running SQL commands to create an extension. This module includes an example for how to connect to the instance from your local machine and create this.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-postgresql-1"></a> [gcp-postgresql-1](#module\_gcp-postgresql-1) | ../../modules/onboard-gcp-postgresql | n/a |
| <a name="module_gcp-postgresql-2"></a> [gcp-postgresql-2](#module\_gcp-postgresql-2) | ../../modules/onboard-gcp-postgresql | n/a |
| <a name="module_gcp-postgresql-3"></a> [gcp-postgresql-3](#module\_gcp-postgresql-3) | ../../modules/onboard-gcp-postgresql | n/a |
| <a name="module_gcp-pubsub-1"></a> [gcp-pubsub-1](#module\_gcp-pubsub-1) | ../../modules/onboard-gcp-pubsub | n/a |
| <a name="module_gcp-pubsub-2"></a> [gcp-pubsub-2](#module\_gcp-pubsub-2) | ../../modules/onboard-gcp-pubsub | n/a |
| <a name="module_gcp-pubsub-3"></a> [gcp-pubsub-3](#module\_gcp-pubsub-3) | ../../modules/onboard-gcp-pubsub | n/a |
| <a name="module_service-account"></a> [service-account](#module\_service-account) | ../../modules/google-service-account-dsf | n/a |

## Resources

| Name | Type |
|------|------|
| [google_sql_user.gcp-postgresql-admin-user-1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [google_sql_user.gcp-postgresql-admin-user-2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [google_sql_user.gcp-postgresql-admin-user-3](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [terraform_data.configure_database_1](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [terraform_data.configure_database_2](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [terraform_data.configure_database_3](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->