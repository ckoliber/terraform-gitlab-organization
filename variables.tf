variable "id" {
  type        = number
  default     = null
  sensitive   = false
  description = "Organization ID"
}

variable "parent_id" {
  type        = number
  default     = null
  sensitive   = false
  description = "Organization Parent ID"
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

variable "desc" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Organization Description"
}

variable "groups" {
  type = map(object({
    path = string
    name = string
    desc = string
    variables = optional(map(object({
      type  = string
      value = string
      scope = optional(string)
    })), {})
  }))
  default     = {}
  sensitive   = false
  description = "Organization Groups"
}

variable "projects" {
  type = map(object({
    path    = string
    name    = string
    desc    = string
    group   = optional(string)
    readers = optional(list(string), [])
    variables = optional(map(object({
      type  = string
      value = string
      scope = optional(string)
    })), {})
    deploy_keys = optional(map(object({
      key   = string
      push  = bool
      title = string
    })), {})
  }))
  default     = {}
  sensitive   = false
  description = "Organization Projects"
}
