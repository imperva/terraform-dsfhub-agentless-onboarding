# ALIBABA Cloud Account Asset

This example covers the various authentication mechanisms that are supported for ALIBABA cloud account assets. This includes the following:

| Auth Mechanism | Notes |
|----------------|-------|
| key | Uses access_key_id (DSF: `access_id`) and access_key_secret (DSF: `access_key`) to authenticate into the account. |
| machine_role | The DSF machine (either Hub or Agentless Gateway) will assume the default ECS RAM role, or the one specified by `role_name`. Can only be used if your DSF machine is an ECS instance. |

More information can be found in the [Alibaba Asset Specifications](https://docs-cybersec.thalesgroup.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Alibaba-Asset-Specifications_35815541.html).
