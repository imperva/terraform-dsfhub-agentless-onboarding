<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws-key-pair-account-asset"></a> [aws-key-pair-account-asset](#module\_aws-key-pair-account-asset) | ../../modules/dsfhub-aws-cloud-account | n/a |
| <a name="module_aws-rds-oracle-standard"></a> [aws-rds-oracle-standard](#module\_aws-rds-oracle-standard) | ../../modules/onboard-aws-rds-oracle-standard | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_data.configure_database](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | n/a | `any` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_host"></a> [dsfhub\_host](#input\_dsfhub\_host) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_token"></a> [dsfhub\_token](#input\_dsfhub\_token) | n/a | `any` | n/a | yes |
<!-- END_TF_DOCS -->