<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) (resource)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_custom_master_key_spec"></a> [custom\_master\_key\_spec](#input\_custom\_master\_key\_spec)

Description: Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC\_DEFAULT, RSA\_2048, RSA\_3072, RSA\_4096, HMAC\_256, ECC\_NIST\_P256, ECC\_NIST\_P384, ECC\_NIST\_P521, or ECC\_SECG\_P256K1.

Type: `string`

Default: `null`

### <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days)

Description: The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive.

Type: `number`

Default: `null`

### <a name="input_description"></a> [description](#input\_description)

Description: The description of the key as viewed in AWS console.

Type: `string`

Default: `null`

### <a name="input_is_enabled"></a> [is\_enabled](#input\_is\_enabled)

Description: Specifies whether the key is enabled.

Type: `bool`

Default: `null`

### <a name="input_key_usage"></a> [key\_usage](#input\_key\_usage)

Description: Specifies the intended use of the key. Valid values: ENCRYPT\_DECRYPT, SIGN\_VERIFY, GENERATE\_VERIFY\_MAC.

Type: `string`

Default: `null`

### <a name="input_multi_region"></a> [multi\_region](#input\_multi\_region)

Description:  Indicates whether the KMS key is a multi-Region (true) or regional (false) key.

Type: `bool`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the object.

Type: `map(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_this"></a> [this](#output\_this)

Description: AWS KMS key
<!-- END_TF_DOCS -->