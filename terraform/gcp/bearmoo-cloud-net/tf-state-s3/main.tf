#This is a bucket for TF state
resource "google_storage_bucket" "tf-state-bucket" {
  project       = "bearmoo-cloud-net"
  name          = "bearmoo-tf-state-bucket"
  location      = "us-east1"
  force_destroy = true
  storage_class = "standard"
  versioning {
    enabled = true
  }
}
