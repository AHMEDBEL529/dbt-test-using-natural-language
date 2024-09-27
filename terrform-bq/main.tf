variable "gcp_project_id" {
  type    = string
  default = ""  # This will be overridden by the environment variable
}

# Enable Identity and Access Management API
resource "google_project_service" "iam" {
  project = var.gcp_project_id
  service = "iam.googleapis.com"
}

# Enable Cloud Resource Manager API
resource "google_project_service" "cloud_resource_manager" {
  project = var.gcp_project_id
  service = "cloudresourcemanager.googleapis.com"
}

# Enable BigQuery API
resource "google_project_service" "bigquery" {
  project = var.gcp_project_id
  service = "bigquery.googleapis.com"
}

# Create the BigQuery Dataset
resource "google_bigquery_dataset" "mydataset" {
  dataset_id = "mydataset"
  location   = "US"
}

# Create a Service Account
resource "google_service_account" "bq_service_account" {
  account_id   = "my-bq-service-account"
  display_name = "BigQuery Service Account"
}

# Assign Roles to the Service Account
resource "google_project_iam_member" "data_editor" {
  project = var.gcp_project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.bq_service_account.email}"
}

resource "google_project_iam_member" "job_user" {
  project = var.gcp_project_id
  role    = "roles/bigquery.jobUser"
  member  = "serviceAccount:${google_service_account.bq_service_account.email}"
}

# Create the Service Account Key
resource "google_service_account_key" "key" {
  service_account_id = google_service_account.bq_service_account.id
}

# Save the keyfile to your local directory
resource "local_file" "keyfile" {
  content  = google_service_account_key.key.private_key
  filename = "${path.module}/my-bq-service-account-key.json"
}

