resource "gitlab_group" "root" {
  count = var.id == null ? 1 : 0

  parent_id        = var.parent_id
  path             = var.path
  name             = var.name
  description      = var.desc
  visibility_level = "internal"
}

locals {
  org_id = coalesce(var.id, gitlab_group.root[0].id)
}
