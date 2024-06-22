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
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | ############################################################################### auth\_mechanism: key ############################################################################### AWS key pair variables (sourced from ENV vars) | `any` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_host"></a> [dsfhub\_host](#input\_dsfhub\_host) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_token"></a> [dsfhub\_token](#input\_dsfhub\_token) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->