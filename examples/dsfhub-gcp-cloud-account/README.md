# GCP Cloud Account Asset

This example covers the various authentication mechanisms that are supported for GCP cloud account assets. This includes the following:

| Auth Mechanism | Notes |
|----------------|-------|
| default | Uses google auth default credentials linked to the service account given by the project id. |
| service_account | Authenticates to the source by using a key file defined in the ``key_file`` field that contains credentials. |

More information can be found in the [GCP Asset Specifications](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/GCP-Asset-Specifications_35816171.html).

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp-default-asset"></a> [gcp-default-asset](#module\_gcp-default-asset) | ../../modules/dsfhub-gcp-cloud-account | n/a |
| <a name="module_gcp-service-account-asset"></a> [gcp-service-account-asset](#module\_gcp-service-account-asset) | ../../modules/dsfhub-gcp-cloud-account | n/a |

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