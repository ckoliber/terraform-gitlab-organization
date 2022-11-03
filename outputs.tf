output "repositories" {
  value = {
    for key, value in var.repositories : key => {
      id  = gitlab_project.this[key].id
      key = tls_private_key.this[key].public_key_openssh
    }
  }
  sensitive   = false
  description = "Organization Repositories"
}
