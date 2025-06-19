module "github-terraform" {
  source = "../modules/IAM_SA"
  display_name = "FWL - Terraform/github (terraform manage)"
  project = var.project
  permissions = var.permissions
  account_id = "github-terraform"
  enable_wif_sa = true
  pool_id           = "gh-terraform"
  provider_id       = "gh-terraform"
  workload_identity_pool_provider_id = "gh-terraform-provider"
  pool_display_name = "gha-terraform (terraform manage)"
  allowed_repos = ["bearmoo-cloud-net/terraform", "bearmoo-cloud-net/terraform-modules"]
}
