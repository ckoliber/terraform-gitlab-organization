output "id" {
  value       = gitlab_group.parent.id
  sensitive   = false
  description = "Application ID"
}

output "repositories" {
  value       = { for key, val in var.repositories : key => gitlab_project.this[key].id }
  sensitive   = false
  description = "Application Repositories"
}
