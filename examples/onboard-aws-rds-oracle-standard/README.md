# Onboard Amazon RDS for Oracle (Standard Audit via CloudWatch) example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/48367051.html).

This example creates both 'aws' and 'dsfhub' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
### Account Asset Permissions
An AWS account asset will need to be onboarded to your DSF hub prior to using this module. The account asset will need to be granted permissions to be able to read from the newly created CloudWatch log group. 

### Database Configuration
Part of the onboarding process involves connecting to your RDS Oracle instance and running SQL commands to create an audit policy. This module includes an example for how to connect to the instance from your local machine and create this. 

**Note:** This example requires the ``sqlplus`` client to be installed, as well as for the newly created RDS instance to be accessible from your local machine. 

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_terraform"></a> [terraform](#provider\_terraform)

## Modules

The following Modules are called:

### <a name="module_aws-key-pair-account-asset"></a> [aws-key-pair-account-asset](#module\_aws-key-pair-account-asset)

Source: imperva/agentless-onboarding/dsfhub//modules/dsfhub-aws-cloud-account

Version:

### <a name="module_aws-rds-oracle-standard-1"></a> [aws-rds-oracle-standard-1](#module\_aws-rds-oracle-standard-1)

Source: ../../modules/onboard-aws-rds-oracle-standard

Version:

### <a name="module_aws-rds-oracle-standard-2"></a> [aws-rds-oracle-standard-2](#module\_aws-rds-oracle-standard-2)

Source: ../../modules/onboard-aws-rds-oracle-standard

Version:

## Resources

The following resources are used by this module:

- [terraform_data.configure_database](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key)

Description: n/a

Type: `any`

### <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key)

Description: n/a

Type: `any`

### <a name="input_dsfhub_host"></a> [dsfhub\_host](#input\_dsfhub\_host)

Description: n/a

Type: `any`

### <a name="input_dsfhub_token"></a> [dsfhub\_token](#input\_dsfhub\_token)

Description: n/a

Type: `any`

## Optional Inputs

No optional inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->