# AZURE Cloud Account Asset

This example covers the various authentication mechanisms that are supported for AZURE cloud account assets. This includes the following:

| Auth Mechanism | Notes |
|----------------|-------|
| auth_file | Uses the credentials defined in a JSON file on the DSF machine that owns the asset. |
| client_secret | Uses an Azure Application secret defined in the ``client_secret`` field to authenticate to Azure. |
| managed_identity | DSF uses the managed identity attached to the DSF machine. Only supported for DSF machines that are Azure Virtual Machines. |

More information can be found in the [AZURE Asset Specifications](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Azure-Asset-Specifications_35815927.html).
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure-auth-file-account-asset"></a> [azure-auth-file-account-asset](#module\_azure-auth-file-account-asset) | ../../modules/dsfhub-azure-cloud-account | n/a |
| <a name="module_azure-client-secret-account-asset"></a> [azure-client-secret-account-asset](#module\_azure-client-secret-account-asset) | ../../modules/dsfhub-azure-cloud-account | n/a |
| <a name="module_azure-managed-identity-account-asset"></a> [azure-managed-identity-account-asset](#module\_azure-managed-identity-account-asset) | ../../modules/dsfhub-azure-cloud-account | n/a |

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
