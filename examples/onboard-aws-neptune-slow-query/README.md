# Onboard Amazon Neptune Slowquery example
This example includes additional prerequisites that will need to be completed to fully utilize the module. More details can be found in the [onboarding documentation](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Amazon-Neptune-Onboarding-Steps_48367003.html).

This example creates both 'aws' and 'dsfhub' resources. More information regarding authentication to each can be found in the relevant provider documentation:
- [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [dsfhub](https://registry.terraform.io/providers/imperva/dsfhub/latest/docs)

## Prerequisites
### Account Asset Permissions
An AWS account asset will need to be onboarded to your DSF hub prior to using this module. The account asset will need to be granted permissions to be able to read from the newly created CloudWatch log group. 

<!-- BEGIN_TF_DOCS -->


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws-default-account-asset"></a> [aws-default-account-asset](#module\_aws-default-account-asset) | ../../modules/dsfhub-aws-cloud-account | n/a |
| <a name="module_aws-neptune-slowquery"></a> [aws-neptune-slowquery](#module\_aws-neptune-slowquery) | ../../modules/onboard-aws-neptune-slow-query | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dsfhub_host"></a> [dsfhub\_host](#input\_dsfhub\_host) | n/a | `any` | n/a | yes |
| <a name="input_dsfhub_token"></a> [dsfhub\_token](#input\_dsfhub\_token) | n/a | `any` | n/a | yes |
<!-- END_TF_DOCS -->