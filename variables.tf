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

variable "projects" {
  type = map(object({
    name        = string
    description = string
  }))
  default     = {}
  sensitive   = false
  description = "Organization Projects"
}
