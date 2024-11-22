# GCP Cloud Account Asset

This example covers the various authentication mechanisms that are supported for AZURE cloud account assets. This includes the following:

| Auth Mechanism | Notes |
|----------------|-------|
| default | Uses google auth default credentials linked to the service account given by the project id. |
| service_account | Authenticates to the source by using a key file defined in the ``key_file`` field that contains credentials. |

More information can be found in the [GCP Asset Specifications](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/GCP-Asset-Specifications_35816171.html).
