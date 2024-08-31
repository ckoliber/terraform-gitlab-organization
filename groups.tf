resource "gitlab_group" "this" {
  for_each = var.groups

  parent_id        = local.org_id
  path             = each.value.path
  name             = each.value.name
  description      = each.value.desc
  visibility_level = "private"
}

resource "gitlab_group_variable" "this" {
  for_each = {
    for item in flatten([
      for key, val in var.groups : [
        for xkey, xval in val.variables : {
          key = "${key}_${xkey}"
          value = {
            group = key
            xkey  = xkey
            xval  = xval
          }
        }
      ]
    ]) : item.key => item.value
  }

  group             = gitlab_group.this[each.value.group].id
  environment_scope = coalesce(each.value.xval.scope, "*")
  key               = each.value.xkey
  value             = each.value.xval.value
  masked            = can(regex("\\A\\w{8,}\\z", each.value.xval.value))
  protected         = each.value.xval.scope != null
  variable_type     = each.value.xval.type
}
