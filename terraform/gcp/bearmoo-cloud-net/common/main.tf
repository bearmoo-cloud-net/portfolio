resource "google_project" "bearmoo" {
  name        = "bearmoo-cloud-net"
  project_id = "bearmoo-cloud-net"

  labels {
    terraform = "true"
  }
}

resource "null_resource" "enable_service_usage_api" {
  provisioner "local-exec" {
    command = "gcloud services enable serviceusage.googleapis.com cloudresourcemanager.googleapis.com --project ${var.project_id}"
  }
}

# Wait for the new configuration to propagate
# (might be redundant)
resource "time_sleep" "wait_project_init" {
  create_duration = "60s"
  depends_on = [null_resource.enable_service_usage_api]
}

resource "google_project_service" "common" {
  for_each = toset([
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iamcredentials.googleapis.com",
    "sts.googleapis.com",
  ])
  service            = each.value
  disable_on_destroy = false
  depends_on = [ time_sleep.wait_project_init ]
}
