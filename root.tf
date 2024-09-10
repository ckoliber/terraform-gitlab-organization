resource "gitlab_group" "root" {
  count = var.id == null ? 1 : 0

  parent_id        = var.parent_id
  path             = var.path
  name             = var.name
  description      = var.desc
  visibility_level = "internal"
}

locals {
  org_id = try(gitlab_group.root[0].id, var.id)
}

resource "gitlab_group_variable" "root" {
  for_each = var.variables

  group             = local.org_id
  environment_scope = coalesce(each.value.scope, "*")
  key               = each.key
  value             = each.value.value
  masked            = can(regex("\\A\\w{8,}\\z", each.value.value))
  protected         = each.value.scope != null
  variable_type     = each.value.type
}
