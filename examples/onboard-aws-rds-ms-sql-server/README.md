# Onboard Amazon RDS for SQL Server example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Amazon-RDS-for-SQL-Server-Onboarding-Steps_48367099.html).

It creates both 'aws' and 'dsfhub' resources. More information regarding authentication to each one can be found in the relevant provider documentation:
- [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
### Database Configuration
Part of the onboarding process involves connecting to your RDS MS SQL Server instance and running SQL commands to create an audit policy. This module includes an example for how to connect to the instance from your local machine and create it. 

**Note:** This example requires the ``sqlcmd`` client to be installed, as well as for the newly created RDS MS SQL Server instance to be accessible from your local machine. 

### Account Asset Permissions
An AWS account asset will need to be onboarded to your DSF hub prior to using this module. The account asset will need to be granted permissions to be able to read from the newly created S3 bucket. In addition, the cloud account should be granted these additional permissions:

```
rds:DescribeOptionGroups
s3:GetObject
s3:ListBucket
s3:ListAllMyBuckets
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

- <a name="provider_terraform"></a> [terraform](#provider\_terraform)

## Modules

The following Modules are called:

### <a name="module_aws-default-account-asset"></a> [aws-default-account-asset](#module\_aws-default-account-asset)

Source: imperva/agentless-onboarding/dsfhub//modules/dsfhub-aws-cloud-account

Version:

### <a name="module_aws-rds-ms-sql-server-1"></a> [aws-rds-ms-sql-server-1](#module\_aws-rds-ms-sql-server-1)

Source: ../../modules/onboard-aws-rds-ms-sql-server

Version:

### <a name="module_aws-rds-ms-sql-server-2"></a> [aws-rds-ms-sql-server-2](#module\_aws-rds-ms-sql-server-2)

Source: ../../modules/onboard-aws-rds-ms-sql-server

Version:

### <a name="module_aws-rds-ms-sql-server-3"></a> [aws-rds-ms-sql-server-3](#module\_aws-rds-ms-sql-server-3)

Source: ../../modules/onboard-aws-rds-ms-sql-server

Version:

## Resources

The following resources are used by this module:

- [terraform_data.configure_database-1](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) (resource)
- [terraform_data.configure_database-2](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) (resource)
- [terraform_data.configure_database-3](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) (resource)
- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)

## Required Inputs

The following input variables are required:

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