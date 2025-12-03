# dsfhub-oracle
Onboard an Oracle asset to DSF Hub with a HashiCorp secret manager.

## Notes
This module contains an example for integrating a secrets managers with the dsfhub_data_source resource. It creates a `HASHICORP` secret manager which will override any field found in the `secret_field_mapping`.

More information can be found in the [Authenticating with Secret Managers](https://docs-cybersec.thalesgroup.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Authenticating-with-Secret-Managers_96731185.html) page.
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_hashicorp-secret"></a> [hashicorp-secret](#module\_hashicorp-secret) | ../../modules/dsfhub-hashicorp-secret-manager | n/a |
| <a name="module_oracle"></a> [oracle](#module\_oracle) | ../../modules/dsfhub-oracle | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dsfhub_host"></a> [dsfhub\_host](#input\_dsfhub\_host) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_token"></a> [dsfhub\_token](#input\_dsfhub\_token) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->