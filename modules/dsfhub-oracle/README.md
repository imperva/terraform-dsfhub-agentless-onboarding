# dsfhub-oracle
Onboard an Oracle asset to DSF Hub.

## Notes
This module supports optionally integrating secrets managers with the dsfhub_data_source resource within its asset_connection block. It relies on the variable `secret_type` which can be one of `amazon`, `cyberark` or `hashicorp`; if it is not set, no secrets manager will be integrated. All the supported `asset_connection` attributes for this `server_type` are set as optional in the `secret_field_mapping` variable and will override the attributes set outside of the secret manager field_mapping.

There is one prerequisite for using this module, if integrating the asset with a secrets manager:
1. An existing `dsfhub_secret_manager` must have already been onboarded to DSF Hub. See the associated example for more details.