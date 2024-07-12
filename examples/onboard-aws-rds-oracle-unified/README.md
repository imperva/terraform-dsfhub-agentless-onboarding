# Onboard Amazon RDS for Oracle (Standard Audit via CloudWatch) example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/48367067.html).

This example creates both 'aws' and 'dsfhub' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
### Database Configuration
Part of the onboarding process involves connecting to your RDS Oracle instance and running SQL commands to create an audit pull user, as well as an audit policy. This module includes an example for how to connect to the instance from your local machine and create both of these. 

**Note:** This example requires the ``sqlplus`` client to be installed, as well as for the newly created RDS instance to be accessible from your local machine. 

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
| <a name="module_aws-rds-oracle-unified-1"></a> [aws-rds-oracle-unified-1](#module\_aws-rds-oracle-unified-1) | ../../modules/onboard-aws-rds-oracle-unified | n/a |
| <a name="module_aws-rds-oracle-unified-2"></a> [aws-rds-oracle-unified-2](#module\_aws-rds-oracle-unified-2) | ../../modules/onboard-aws-rds-oracle-unified | n/a |

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