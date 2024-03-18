resource "google_service_account" "service_account" {
  account_id   = "my-service-account"
  display_name = "My Service Account"
}

resource "google_project_iam_member" "service_account_permissions" {
  project = "my-project"
  role    = "roles/iam.serviceAccountAdmin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}
