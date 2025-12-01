# dsfhub-oracle
Onboard an Oracle asset to DSF Hub with a HashiCorp secret manager.

## Notes
This module contains an example for integrating a secrets managers with the dsfhub_data_source resource. It creates a `HASHICORP` secret manager which will override any field found in the `secret_field_mapping`.

More information can be found in the [Authenticating with Secret Managers](https://docs-cybersec.thalesgroup.com/bundle/onboarding-databases-to-sonar-reference-guide/page/Authenticating-with-Secret-Managers_96731185.html) page.