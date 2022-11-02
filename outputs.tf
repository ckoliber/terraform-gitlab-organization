output "projects" {
  value       = { for key, value in var.projects : key => gitlab_project.this[key].id }
  sensitive   = false
  description = "Organization Projects"
}

output "registry_endpoint" {
  value       = "registry.gitlab.com"
  sensitive   = false
  description = "Organization Registry Endpoint"
}

output "registry_username" {
  value       = gitlab_deploy_token.this.username
  sensitive   = true
  description = "Organization Registry Username"
}

output "registry_password" {
  value       = gitlab_deploy_token.this.token
  sensitive   = true
  description = "Organization Registry Password"
}
