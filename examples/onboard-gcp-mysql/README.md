# Onboard Google Cloud SQL for MySQL example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Cloud-SQL-for-MySQL-Onboarding-Steps_48367584.html).

This example creates 'dsfhub' and 'google' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)
- [google](https://registry.terraform.io/providers/hashicorp/google/latest/docs)

## Prerequisites
### Service Account
A Google Service Account will need to be created with permissions to read from PubSub subscriptions. This can be done via the ``google-service-account-dsf`` module. Depending on the authentication mechanism chosen, the service account will either need to be attached to a GCP Compute Engine instance or the service account's credentials file will need to be copied to your Agentless Gateway.

### Data Access Audit Logs
Data Access audit logs should be enabled for the Cloud SQL API service in your GCP project, including "Admin Read", "Data Read" and "Data Write" permissions. For more information and instructions for enabling them, see [Cloud SQL for MySQL audit logging](https://cloud.google.com/sql/docs/mysql/audit-logging) and [Enable Data Access audit logs](https://cloud.google.com/logging/docs/audit/configure-data-access). While this may be configured via Terraform using the [google_project_iam_audit_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_audit_config) resource, it is not recommended due to the risk of inadvertently locking yourself out of your GCP project.

### Google PubSub Subscription
A Google logging sink, PubSub topic, and PubSub subscription in addition to a GCP PUBSUB asset in DSF will need to be created in advance. This prerequisite is handled by the ``onboard-gcp-pubsub`` module.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-mysql-1"></a> [gcp-mysql-1](#module\_gcp-mysql-1) | ../../modules/onboard-gcp-mysql | n/a |
| <a name="module_gcp-mysql-2"></a> [gcp-mysql-2](#module\_gcp-mysql-2) | ../../modules/onboard-gcp-mysql | n/a |
| <a name="module_gcp-mysql-3"></a> [gcp-mysql-3](#module\_gcp-mysql-3) | ../../modules/onboard-gcp-mysql | n/a |
| <a name="module_gcp-pubsub-1"></a> [gcp-pubsub-1](#module\_gcp-pubsub-1) | ../../modules/onboard-gcp-pubsub | n/a |
| <a name="module_gcp-pubsub-2-audit"></a> [gcp-pubsub-2-audit](#module\_gcp-pubsub-2-audit) | ../../modules/onboard-gcp-pubsub | n/a |
| <a name="module_gcp-pubsub-2-slow-query"></a> [gcp-pubsub-2-slow-query](#module\_gcp-pubsub-2-slow-query) | ../../modules/onboard-gcp-pubsub | n/a |
| <a name="module_gcp-pubsub-3"></a> [gcp-pubsub-3](#module\_gcp-pubsub-3) | ../../modules/onboard-gcp-pubsub | n/a |
| <a name="module_service-account"></a> [service-account](#module\_service-account) | ../../modules/google-service-account-dsf | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
