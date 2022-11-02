output "projects" {
  value       = { for key, value in var.projects : key => gitlab_project.this[key].id }
  sensitive   = false
  description = "Gitlab Organization Projects"
}

output "registry_endpoint" {
  value       = "registry.gitlab.com"
  sensitive   = false
  description = "Gitlab Organization Registry Endpoint"
}

output "registry_username" {
  value       = gitlab_deploy_token.this.username
  sensitive   = true
  description = "Gitlab Organization Registry Username"
}

output "registry_password" {
  value       = gitlab_deploy_token.this.token
  sensitive   = true
  description = "Gitlab Organization Registry Password"
}
