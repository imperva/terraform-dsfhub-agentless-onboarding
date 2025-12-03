# ALIBABA Cloud Account Asset

This example covers the various authentication mechanisms that are supported for ALIBABA cloud account assets. This includes the following:

| Auth Mechanism | Notes |
|----------------|-------|
| key | Uses access_key_id (DSF: `access_id`) and access_key_secret (DSF: `access_key`) to authenticate into the account. |
| machine_role | The DSF machine (either Hub or Agentless Gateway) will assume the default ECS RAM role, or the one specified by `role_name`. Can only be used if your DSF machine is an ECS instance. |

More information can be found in the [Alibaba Asset Specifications](https://docs-cybersec.thalesgroup.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Alibaba-Asset-Specifications_35815541.html).

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alibaba-key-account-asset"></a> [alibaba-key-account-asset](#module\_alibaba-key-account-asset) | ../../modules/dsfhub-alibaba-cloud-account | n/a |
| <a name="module_alibaba-machine-role-account-asset"></a> [alibaba-machine-role-account-asset](#module\_alibaba-machine-role-account-asset) | ../../modules/dsfhub-alibaba-cloud-account | n/a |

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