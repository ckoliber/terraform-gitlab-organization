output "repositories" {
  value       = { for key, value in var.projects : key => gitlab_project.this[key].id }
  sensitive   = false
  description = "Organization Repositories"
}
