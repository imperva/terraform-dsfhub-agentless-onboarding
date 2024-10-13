# google-service-account-dsf
Creates a Google Service Account with permissiosn to be used for DSF audit pulls or discovery. Defaults to being granted the minimum permissions required to pull audit data from a PubSub subscription. If ``auth_mechanism = service_account`` is selected, will also create a JSON credentials file for the account that can be copied to an Agentless gateway.

