variable "account_id" {
  type = string
  default = "my-account-id"
}

variable "title" {
  type = string
  default = "my-title"
}

variable "allowed_repos" {
  type = list(string)
  default = []
}
  
variable "description" {
  type = string
  default = ""
}

variable "display_name" {
  type = string
  default = "bob ross"
}

variable "project" {
  type = string
  default = "bearmoo-cloud-net"
}

variable "permissions" {
  type = list(string)
  default = ["iam.roles.list", "iam.roles.create", "iam.roles.delete", "blah"]
}