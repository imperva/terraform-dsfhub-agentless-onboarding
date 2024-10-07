output "this" {
  description = "Attachment of a Google IAM role to a Service Account."
  value       = google_service_account_iam_binding.this
}
