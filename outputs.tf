output "repositories" {
  value       = { for key, val in var.repositories : key => gitlab_project.this[key].id }
  sensitive   = false
  description = "Organization Repositories"
}
