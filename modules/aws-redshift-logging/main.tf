resource "aws_redshift_logging" "this" {
  cluster_identifier   = var.cluster_identifier
  log_destination_type = var.log_destination_type

  bucket_name   = var.log_destination_type == "s3" ? var.bucket_name : null
  s3_key_prefix = var.log_destination_type == "s3" ? var.s3_key_prefix : null
}
