resource "google_service_account" "this" {
  account_id   = var.account_id
  display_name = var.display_name
  project      = var.project
}

resource "google_project_iam_member" "this" {
  role = "projects/${var.project}/roles/${google_project_iam_custom_role.this.role_id}"
  member  = "serviceAccount:${google_service_account.this.email}"
  project = var.project
  depends_on = [ google_project_iam_custom_role.this, google_service_account.this ]
}

resource "google_project_iam_custom_role" "this" {
  role_id     = replace("${var.account_id}-role", "-", "_")
  title       = "${var.account_id}-role"
  description = var.description
  permissions = var.permissions
  project = var.project
  depends_on = [ google_service_account.this ]
}

resource "google_iam_workload_identity_pool" "this" {
  count   = "${var.enable_wif_sa ? 1 : 0}"
  description               = var.pool_display_name
  disabled                  = false
  display_name              = var.pool_display_name
  project                   = var.project
  workload_identity_pool_id = var.pool_id
}

resource "google_iam_workload_identity_pool_provider" "this" {
  count   = "${var.enable_wif_sa ? 1 : 0}"
  attribute_condition = local.sub_conditions

  attribute_mapping = {
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
    "google.subject"       = "assertion.sub"
  }
  description                        = "Workload Identity Pool Provider (Terraform manage)"
  disabled                           = var.disabled_wif_pool_provider
  display_name                       = var.pool_display_name
  project                            = var.project
  workload_identity_pool_id          = google_iam_workload_identity_pool.this[0].workload_identity_pool_id
  workload_identity_pool_provider_id = var.workload_identity_pool_provider_id
  oidc {
    allowed_audiences = []
    issuer_uri        = "https://token.actions.githubusercontent.com"
    jwks_json         = null
  }
  depends_on = [ google_iam_workload_identity_pool.this ]
}

//You can also use it attribute_condition = “assertion.repository_owner==’orgname’ && assertion.repository 
// in ${jsonencode(local.allowed_repos)}” if you only want to control the allowed repo under the GitHub organization.
resource "google_service_account_iam_member" "this" {
  for_each = var.enable_wif_sa ? toset(var.allowed_repos) : []
  service_account_id = "projects/${var.project}/serviceAccounts/${google_service_account.this.email}"
  role               = "roles/iam.workloadIdentityUser"
  member = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.this[0].name}/attribute.repository/${each.value}"
}