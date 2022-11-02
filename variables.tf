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

variable "tenants" {
  type = map(object({
    name        = string
    description = string
    repositories = map(object({
      name         = string
      description  = string
      dependencies = list(string)
      variables    = map(string)
      files        = map(string)
    }))
  }))
  default     = {}
  sensitive   = false
  description = "Organization Tenants"
}
