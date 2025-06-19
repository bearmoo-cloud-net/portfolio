# Allowed GitHub repos to use the workload identity federation service account
locals {
  allowed_branches = [
    "main",
  ]

  sub_conditions = join(" || ", flatten([
    # For each repo
    for repo in var.allowed_repos : [
      [for branch in local.allowed_branches :
      "(assertion.sub=='repo:${repo}:ref:refs/heads/${branch}')"],
      ["(assertion.sub=='repo:${repo}:pull_request')"]
    ]
  ]))
}

variable "account_id" {
  type = string
  default = "my-account-id"
}

variable "allowed_repos" {
  type = list(string)
  default = [
    "some-user-id/my-repo",
    "hello/world"
  ]
}

variable "title" {
  type = string
  default = "my-title"
}

variable "description" {
  type = string
  default = ""
}

variable "disabled_wif_pool_provider" {
  type = bool
  default = false  
}

variable "workload_identity_pool_provider_id" {
  type = string
  default = "some-provider"
}

variable "display_name" {
  type = string
  default = "bob ross"
}

variable "pool_id" {
  type = string
  default = "gh-identity-pool"
}

variable "provider_id" {
  type = string
  default = "gh-provider"
}

variable "pool_display_name" {
  type = string
  default = "Identity Pool"
}

variable "project" {
  type = string
  default = "bearmoo-cloud-net"
}

variable "enable_wif_sa" {
  type = bool
  default = false
}

variable "permissions" {
  type = list(string)
  default = ["iam.roles.list", "iam.roles.create", "iam.roles.delete", "blah"]
}
