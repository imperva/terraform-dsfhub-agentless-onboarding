# AZURE Cloud Account Asset

This example covers the various authentication mechanisms that are supported for AZURE cloud account assets. This includes the following:

| Auth Mechanism | Notes |
|----------------|-------|
| auth_file | Uses the credentials defined in a JSON file on the DSF machine. |
| client_secret | Uses an Azure Application secret defined in the ``client_secret`` field to authenticate to Azure. |
| managed_identity | DSF uses the managed identity attached to the DSF machine. Only supported for DSF machines that are Azure Virtual Machines. |

More information can be found in the [AZURE Asset Specifications](https://docs.imperva.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Azure-Asset-Specifications_35815927.html).