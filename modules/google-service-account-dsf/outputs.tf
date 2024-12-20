output "account" {
  description = "Google Service Account."
  value       = google_service_account.account
}

output "permissions" {
  description = "Service Account permissions."
  value       = google_project_iam_member.permissions
}

output "key" {
  description = "Authentication key for the Service Account."
  value       = google_service_account_key.key
}

output "key_file_path" {
  description = "JSON key file containing the Service Account credentials."
  value       = "${path.root}/${var.account_id}"
}
