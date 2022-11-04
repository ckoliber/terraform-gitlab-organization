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
  description = "Application Path"
}

variable "name" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Application Name"
}

variable "description" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Application Description"
}

variable "teams" {
  type = map(object({
    name        = string
    description = string
  }))
  default     = {}
  sensitive   = false
  description = "Application Teams"
}

variable "repositories" {
  type = map(object({
    team        = string
    name        = string
    description = string
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
  description = "Application Repositories"
}
