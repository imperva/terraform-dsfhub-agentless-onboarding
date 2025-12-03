# AWS Cloud Account Asset

This example covers the various authentication mechanisms that are supported for AWS cloud account assets. This includes the following:

| Auth Mechanism | Notes |
|----------------|-------|
| default | DSF uses the IAM role attached to the EC2 instance metadata. If there is no IAM role attached, DSF will look for a profile name called ``default`` in the AWS credentials file located at ``/path/to/JSONAR_LOCALDIR/credentials/.aws/credentials``. |
| iam_role | The DSF machine (either Hub or Agentless Gateway) will assume the role specified in the ``arn`` field. Only supported for DSF machines that are EC2 instances. |
| key | Uses ``aws_access_key`` and ``aws_secret_key`` to authenticate with the given IAM user access keys. |
| profile | Uses an AWS profile specified in the ``profile_name`` field and defined in the AWS credentials file located at ``/path/to/JSONAR_LOCALDIR/credentials/.aws/credentials``. | 

More information can be found in the [AWS Asset Specifications](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/AWS-Asset-Specifications_35815635.html).

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws-default-account-asset"></a> [aws-default-account-asset](#module\_aws-default-account-asset) | ../../modules/dsfhub-aws-cloud-account | n/a |
| <a name="module_aws-iam-role-account-asset"></a> [aws-iam-role-account-asset](#module\_aws-iam-role-account-asset) | ../../modules/dsfhub-aws-cloud-account | n/a |
| <a name="module_aws-key-pair-account-asset"></a> [aws-key-pair-account-asset](#module\_aws-key-pair-account-asset) | ../../modules/dsfhub-aws-cloud-account | n/a |
| <a name="module_aws-profile-account-asset"></a> [aws-profile-account-asset](#module\_aws-profile-account-asset) | ../../modules/dsfhub-aws-cloud-account | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | n/a | `any` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_host"></a> [dsfhub\_host](#input\_dsfhub\_host) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_token"></a> [dsfhub\_token](#input\_dsfhub\_token) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
