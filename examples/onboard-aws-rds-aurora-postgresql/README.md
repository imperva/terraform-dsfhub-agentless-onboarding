# Onboard Amazon Aurora PostgreSQL example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Amazon-Aurora-PostgreSQL-Onboarding-Steps_48366929.html).

This example creates both 'aws' and 'dsfhub' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
### Account Asset Permissions
An AWS account asset will need to be onboarded to your DSF hub prior to using this module. The account asset will need to be granted permissions to be able to read from the newly created CloudWatch log group. 

### Database Configuration
Part of the onboarding process involves connecting to your Aurora PostgreSQL cluster and running SQL commands to create both a role and an extension. This module includes an example for how to connect to the instance from your local machine and create both of these. 

**Note:** This example requires the ``psql`` client to be installed, as well as for the newly created Aurora cluster to be accessible from your local machine. 

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aurora-postgresql-1"></a> [aurora-postgresql-1](#module\_aurora-postgresql-1) | ../../modules/onboard-aws-rds-aurora-postgresql | n/a |
| <a name="module_aurora-postgresql-2"></a> [aurora-postgresql-2](#module\_aurora-postgresql-2) | ../../modules/onboard-aws-rds-aurora-postgresql | n/a |
| <a name="module_aurora-postgresql-3"></a> [aurora-postgresql-3](#module\_aurora-postgresql-3) | ../../modules/onboard-aws-rds-aurora-postgresql | n/a |
| <a name="module_aws-default-account-asset"></a> [aws-default-account-asset](#module\_aws-default-account-asset) | ../../modules/dsfhub-aws-cloud-account | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_data.configure_database](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dsfhub_host"></a> [dsfhub\_host](#input\_dsfhub\_host) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_token"></a> [dsfhub\_token](#input\_dsfhub\_token) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->