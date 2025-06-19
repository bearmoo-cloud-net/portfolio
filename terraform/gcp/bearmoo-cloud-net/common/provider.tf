terraform {
  required_version = ">= 0.12"
  backend "gcs" {
    bucket      = "bearmoo-tf-state-bucket"
    prefix      = "global/remote/common"
  }
}

provider "google" {
#  credentials = file(var.gcp_auth_file)
  project     = "bearmoo-cloud-net"
  region      = "us-east1"
}
