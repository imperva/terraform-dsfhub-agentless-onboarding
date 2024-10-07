resource "google_service_account" "this" {
  account_id                   = var.account_id
  create_ignore_already_exists = var.create_ignore_already_exists
  disabled                     = var.disabled
  display_name                 = var.display_name
  description                  = var.description
  project                      = var.project
}
