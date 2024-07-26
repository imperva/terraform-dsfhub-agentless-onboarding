# Onboard Amazon DynamoDB via S3 Bucket
This example will cover the ways to onboard Amazon DynamoDB via S3, including the various authentication mechanisms that are supported to authenticate to AWS and access the audit logs. This includes the following:

| Auth Mechanism | Notes |
|----------------|-------|
| default | DSF uses the IAM role attached to the EC2 instance metadata. If there is no IAM role attached, DSF will look for a profile name called ``default`` in the AWS credentials file located at ``${JSONAR_LOCALDIR}/credentials/.aws/credentials``. |
| iam_role | The DSF machine (either Hub or Agentless Gateway) will assume the role specified in the ``aws_dynamodb_iam_role_name`` field. Only supported for DSF machines that are EC2 instances. |
| key | Uses ``aws_dynamodb_access_id`` and ``aws_secret_key`` to authenticate with the given IAM user access keys. |
| profile | Uses an AWS profile specified in the ``aws_dynamodb_profile_name`` field and defined in the AWS credentials file located at ``${JSONAR_LOCALDIR}/credentials/.aws/credentials``. | 


More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Amazon-DynamoDB-via-S3-Onboarding-Steps_152764418.html).

This example creates both 'aws' and 'dsfhub' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dynamodb-1"></a> [dynamodb-1](#module\_dynamodb-1) | ../../modules/onboard-aws-dynamodb-s3 | n/a |
| <a name="module_dynamodb-2"></a> [dynamodb-2](#module\_dynamodb-2) | ../../modules/onboard-aws-dynamodb-s3 | n/a |
| <a name="module_dynamodb-3"></a> [dynamodb-3](#module\_dynamodb-3) | ../../modules/onboard-aws-dynamodb-s3 | n/a |
| <a name="module_dynamodb-4"></a> [dynamodb-4](#module\_dynamodb-4) | ../../modules/onboard-aws-dynamodb-s3 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_dynamodb_access_id"></a> [aws\_dynamodb\_access\_id](#input\_aws\_dynamodb\_access\_id) | n/a | `any` | n/a | yes |
| <a name="input_aws_dynamodb_secret_key"></a> [aws\_dynamodb\_secret\_key](#input\_aws\_dynamodb\_secret\_key) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_host"></a> [dsfhub\_host](#input\_dsfhub\_host) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_token"></a> [dsfhub\_token](#input\_dsfhub\_token) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->