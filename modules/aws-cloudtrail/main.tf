resource "aws_cloudtrail" "this" {
  cloud_watch_logs_group_arn    = var.cloud_watch_logs_group_arn
  cloud_watch_logs_role_arn     = var.cloud_watch_logs_role_arn
  enable_logging                = var.enable_logging
  include_global_service_events = var.include_global_service_events
  is_multi_region_trail         = var.is_multi_region_trail
  name                          = var.name
  s3_bucket_name                = var.s3_bucket_name
  s3_key_prefix                 = var.s3_key_prefix

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

  dynamic "advanced_event_selector" {
    # If advanced_event_selector is not defined, do not create
    for_each = var.advanced_event_selector != null ? var.advanced_event_selector : []

    content {
      name = advanced_event_selector.value.name
      dynamic "field_selector" {
        for_each = advanced_event_selector.value.field_selector != null ? advanced_event_selector.value.field_selector : []

        content {
          field           = field_selector.value.field
          equals          = field_selector.value.equals != null ? field_selector.value.equals : null
          starts_with     = field_selector.value.starts_with != null ? field_selector.value.starts_with : null
          ends_with       = field_selector.value.ends_with != null ? field_selector.value.ends_with : null
          not_equals      = field_selector.value.not_equals != null ? field_selector.value.not_equals : null
          not_starts_with = field_selector.value.not_starts_with != null ? field_selector.value.not_starts_with : null
          not_ends_with   = field_selector.value.not_ends_with != null ? field_selector.value.not_ends_with : null
        }
      }
    }
  }
}
