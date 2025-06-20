# Onboard Google AlloyDB for PostgreSQL example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/AlloyDB-for-PostgreSQL-Onboarding-Steps_48367524.html).

This example creates 'dsfhub' and 'google' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)
- [google](https://registry.terraform.io/providers/hashicorp/google/latest/docs)

## Prerequisites
### Service Account
The user or service account used for running the module will require the AlloyDB Admin role for configuring the cluster including modifying database flags.

A Google Service Account will need to be created with permissions to read from PubSub subscriptions. This can be done via the ``google-service-account-dsf`` module. Depending on the authentication mechanism chosen, the service account will either need to be attached to a GCP Compute Engine instance or the service account's credentials file will need to be copied to your Agentless Gateway.

### Data Access Audit Logs
Data Access audit logs should be enabled for the AlloyDB API service in your GCP project, including "Admin Read", "Data Read" and "Data Write" permissions. For more information and instructions for enabling them, see [GCP AlloyDB Audit Logs](https://cloud.google.com/alloydb/docs/audit-logging) and [Enable Data Access audit logs](https://cloud.google.com/logging/docs/audit/configure-data-access). While this may be configured via Terraform using the [google_project_iam_audit_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_audit_config) resource, it is not recommended due to the risk of inadvertently locking yourself out of your GCP project.

### Google PubSub Subscription
A Google logging sink, PubSub topic, and PubSub subscription in addition to a GCP PUBSUB asset in DSF will need to be created in advance. This prerequisite is handled by the ``onboard-gcp-pubsub`` module.

### Database Configuration
Part of the onboarding process involves connecting to your Google AlloyDB for PostgreSQL instance and running SQL commands to create an extension. This module includes an example for how to connect to the instance from your local machine and create this.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_dsfhub"></a> [dsfhub](#requirement\_dsfhub) | >= 1.3.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-alloydb-postgresql-1"></a> [gcp-alloydb-postgresql-1](#module\_gcp-alloydb-postgresql-1) | ../../modules/onboard-gcp-alloydb-postgresql | n/a |
| <a name="module_gcp-alloydb-postgresql-2"></a> [gcp-alloydb-postgresql-2](#module\_gcp-alloydb-postgresql-2) | ../../modules/onboard-gcp-alloydb-postgresql | n/a |
| <a name="module_gcp-alloydb-postgresql-3"></a> [gcp-alloydb-postgresql-3](#module\_gcp-alloydb-postgresql-3) | ../../modules/onboard-gcp-alloydb-postgresql | n/a |
| <a name="module_gcp-pubsub-1"></a> [gcp-pubsub-1](#module\_gcp-pubsub-1) | ../../modules/onboard-gcp-pubsub | n/a |
| <a name="module_gcp-pubsub-2"></a> [gcp-pubsub-2](#module\_gcp-pubsub-2) | ../../modules/onboard-gcp-pubsub | n/a |
| <a name="module_gcp-pubsub-3"></a> [gcp-pubsub-3](#module\_gcp-pubsub-3) | ../../modules/onboard-gcp-pubsub | n/a |
| <a name="module_service-account"></a> [service-account](#module\_service-account) | ../../modules/google-service-account-dsf | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_data.configure_database_1](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [terraform_data.configure_database_2](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [terraform_data.configure_database_3](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [http_http.my-ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dsfhub_host"></a> [dsfhub\_host](#input\_dsfhub\_host) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_token"></a> [dsfhub\_token](#input\_dsfhub\_token) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->