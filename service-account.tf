resource "google_service_account" "serviceacc" {
  account_id   = "amiragcpserviceaccount2"
  display_name = "Service Account"
}

resource "google_project_iam_binding" "admin-account-iam" {
  project = "amira-gcp"
  role    = "roles/container.admin"

  members = [
    "serviceAccount:${google_service_account.serviceacc.email}",
  ]
}