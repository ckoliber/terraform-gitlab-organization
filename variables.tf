variable "group_id" {
  type        = number
  default     = 0
  sensitive   = false
  description = "Group ID"
}

variable "path" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Organization Path"
}

variable "name" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Organization Name"
}

variable "description" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Organization Description"
}

variable "teams" {
  type = map(object({
    name        = string
    description = string
  }))
  default     = {}
  sensitive   = false
  description = "Organization Teams"
}

variable "repositories" {
  type = map(object({
    team         = string
    name         = string
    description  = string
    dependencies = list(string)
    deploy_keys = map(object({
      key   = string
      push  = bool
      title = string
    }))
    secrets = map(object({
      type      = string
      value     = string
      protected = bool
    }))
  }))
  default     = {}
  sensitive   = false
  description = "Organization Repositories"
}
