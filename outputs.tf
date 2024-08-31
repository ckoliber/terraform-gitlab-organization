output "id" {
  value       = local.org_id
  sensitive   = false
  description = "Organization ID"
}

output "groups" {
  value       = { for key, val in gitlab_group.this : key => val.id }
  sensitive   = false
  description = "Organization Groups"
}

output "projects" {
  value       = { for key, val in gitlab_project.this : key => val.id }
  sensitive   = false
  description = "Organization Projects"
}
