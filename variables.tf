variable "group_id" {
  type        = number
  default     = 0
  sensitive   = false
  description = "Gitlab Group ID"
}

variable "path" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Gitlab Organization Path"
}

variable "name" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Gitlab Organization Name"
}

variable "description" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Gitlab Organization Description"
}

variable "projects" {
  type = map(object({
    name        = string
    description = string
  }))
  default     = {}
  sensitive   = false
  description = "Gitlab Organization Projects"
}
