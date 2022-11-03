resource "gitlab_group" "parent" {
  parent_id        = var.group_id
  path             = var.path
  name             = var.name
  description      = var.description
  visibility_level = "private"
}

resource "gitlab_group" "this" {
  for_each = var.teams

  parent_id        = gitlab_group.parent.id
  path             = each.key
  name             = each.value.name
  description      = each.value.description
  visibility_level = "private"
}
