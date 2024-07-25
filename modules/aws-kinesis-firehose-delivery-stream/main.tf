resource "aws_kinesis_firehose_delivery_stream" "this" {
  destination = var.destination
  name        = var.name
  tags        = var.tags

  dynamic "extended_s3_configuration" {
    # If extended_s3_configuration is not defined, do not create
    for_each = [var.extended_s3_configuration] != null ? [var.extended_s3_configuration] : []

    content {
      bucket_arn          = extended_s3_configuration.value.bucket_arn
      compression_format  = extended_s3_configuration.value.compression_format
      error_output_prefix = extended_s3_configuration.value.error_output_prefix
      file_extension      = extended_s3_configuration.value.file_extension
      prefix              = extended_s3_configuration.value.prefix
      role_arn            = extended_s3_configuration.value.role_arn

      dynamic "processing_configuration" {
        # If processing_configuration is not defined, do not create
        for_each = [extended_s3_configuration.value.processing_configuration] != null ? [extended_s3_configuration.value.processing_configuration] : []

        content {
          enabled = processing_configuration.value.enabled

          dynamic "processors" {
            # If processors is not defined, do not create
            for_each = [processing_configuration.value.processors] != null ? [processing_configuration.value.processors] : []

            content {
              type = processors.value.type
              # TODO: support 'parameters' block, see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream.html#parameters-block
            }
          }
        }
      }
    }
  }
}
