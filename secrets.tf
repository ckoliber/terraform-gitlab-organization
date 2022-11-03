resource "gitlab_project_variable" "this" {
  for_each = {
    for item in flatten([
      for k1, v1 in var.repositories : [
        for k2, v2 in v1.secrets : {
          key = "${k1}.${k2}"
          value = {
            repository = k1
            key        = k2
            val        = v2
          }
        }
      ]
    ]) : item.key => item.value
  }

  project           = gitlab_project.this[each.value.repository].id
  environment_scope = "*"
  key               = each.value.key
  value             = each.value.val.value
  masked            = can(regex("\\A\\w{8,}\\z", each.value.val.value))
  protected         = each.value.val.protected
  variable_type     = each.value.val.type
}
