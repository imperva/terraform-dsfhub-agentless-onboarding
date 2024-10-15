resource "google_service_account" "account" {
  account_id                   = var.account_id
  create_ignore_already_exists = var.create_ignore_already_exists
  disabled                     = var.disabled
  display_name                 = var.display_name
  description                  = var.description
  project                      = var.project

  provisioner "local-exec" {
    command = "sleep 20"
  }
}

resource "google_project_iam_member" "permissions" {
  for_each = toset(var.project_roles)

  member  = google_service_account.account.member
  project = var.project
  role    = each.value
}

resource "google_service_account_key" "key" {
  count      = var.auth_mechanism == "service_account" ? 1 : 0
  depends_on = [google_service_account.account]

  service_account_id = var.account_id
}

resource "local_file" "service_account_key_file" {
  count = var.auth_mechanism == "service_account" ? 1 : 0

  filename = "${path.root}/${var.account_id}.json"
  content  = base64decode(google_service_account_key.key[0].private_key)
}
