resource "tls_private_key" "this" {
  for_each = var.repositories

  algorithm = "ECDSA"
}

resource "gitlab_project_variable" "key" {
  for_each = var.repositories

  project           = gitlab_project.this[each.key].id
  environment_scope = "*"
  key               = "GITLAB_KEY"
  value             = tls_private_key.this[each.key].private_key_openssh
  masked            = false
  protected         = false
  variable_type     = "env_var"
}

resource "gitlab_deploy_key" "dependencies" {
  for_each = {
    for item in flatten([
      for k1, v1 in var.repositories : [
        for k2 in v1.dependencies : {
          key = "${k1}.${k2}"
          value = {
            repository = k1
            val        = k2
          }
        }
      ]
    ]) : item.key => item.value
  }

  project  = gitlab_project.this[each.value.repository].id
  key      = tls_private_key.this[each.value.val].public_key_openssh
  title    = each.value.val
  can_push = false
}
