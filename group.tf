resource "gitlab_group" "this" {
  parent_id        = var.group_id
  path             = var.path
  name             = var.name
  description      = var.description
  visibility_level = "private"
}

resource "gitlab_deploy_token" "this" {
  group  = gitlab_group.this.id
  name   = "Registry Token"
  scopes = ["read_registry"]
}
