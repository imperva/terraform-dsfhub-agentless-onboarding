resource "aws_db_option_group" "this" {
  name                     = var.name
  option_group_description = var.description
  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version
  tags                     = var.tags

  dynamic "option" {
    for_each = var.options

    content {
      option_name                    = option.value.option_name
      port                           = option.value.port != null ? option.value.port : null
      version                        = option.value.version != null ? option.value.version : null
      db_security_group_memberships  = option.value.db_security_group_memberships != null ? option.value.db_security_group_memberships : null
      vpc_security_group_memberships = option.value.vpc_security_group_memberships != null ? option.value.vpc_security_group_memberships : null

      dynamic "option_settings" {
        for_each = option.value.option_settings != null ? option.value.option_settings : []

        content {
          name = option_settings.value.name
          value = option_settings.value.value
        }
      }
    }
  }
}
