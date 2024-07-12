# Onboard Amazon Redshift example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Amazon-Redshift-Onboarding-Steps_48367115.html).

It creates both 'aws' and 'dsfhub' resources. More information regarding authentication to each one can be found in the relevant provider documentation:
- [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

Importantly, the example includes two different audit methods: auditing via the Audit Tables, or auditing via an S3 bucket. <b>Please choose your desired audit method</b>.

## Option 1: Auditing via Audit Tables
### Prerequisites
#### Database Configuration
Part of the onboarding process involves connecting to your Redshift cluster and running SQL commands to create an audit pull user. This module includes an example for how to connect to the instance from your local machine and create it. 

**Note:** This example requires the ``psql`` client to be installed, as well as for the newly created Redshift cluster to be accessible from your local machine. 

## Option 2: Auditing via S3

### Prerequisites
#### Account Asset Permissions
An AWS account asset will need to be onboarded to your DSF hub prior to using this module. The account asset will need to be granted permissions to be able to read from the newly created S3 bucket. In addition, the cloud account should be granted these additional permissions:

```
s3:GetObject
s3:ListBucket
s3:ListAllMyBuckets
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws-default-account-asset"></a> [aws-default-account-asset](#module\_aws-default-account-asset) | imperva/agentless-onboarding/dsfhub//modules/dsfhub-aws-cloud-account | n/a |
| <a name="module_aws-redshift-1"></a> [aws-redshift-1](#module\_aws-redshift-1) | ../../modules/onboard-aws-redshift-s3 | n/a |
| <a name="module_aws-redshift-cluster-1"></a> [aws-redshift-cluster-1](#module\_aws-redshift-cluster-1) | ../../modules/onboard-aws-redshift-odbc | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_data.configure_database](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dsfhub_host"></a> [dsfhub\_host](#input\_dsfhub\_host) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_token"></a> [dsfhub\_token](#input\_dsfhub\_token) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->