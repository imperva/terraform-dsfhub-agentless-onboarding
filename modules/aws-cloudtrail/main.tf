resource "aws_cloudtrail" "this" {
  enable_logging                = var.enable_logging
  include_global_service_events = var.include_global_service_events
  is_multi_region_trail         = var.is_multi_region_trail
  name                          = var.name
  s3_bucket_name                = var.s3_bucket_name

  dynamic "event_selector" {
    # If event_selector is not defined, do not create
    for_each = var.event_selector != null ? var.event_selector : []

    content {
      dynamic "data_resource" {
        for_each = [event_selector.value.data_resource] != null ? [event_selector.value.data_resource] : []

        content {
          type   = data_resource.value.type
          values = data_resource.value.values
        }
      }
      exclude_management_event_sources = event_selector.value.exclude_management_event_sources != null ? event_selector.value.exclude_management_event_sources : null
      include_management_events        = event_selector.value.include_management_events != null ? event_selector.value.include_management_events : null
      read_write_type                  = event_selector.value.read_write_type != null ? event_selector.value.read_write_type : null
    }
  }
}
