resource "google_alloydb_user" "this" {
  cluster        = var.cluster
  database_roles = var.database_roles
  password       = var.password
  user_id        = var.user_id
  user_type      = var.user_type
}
