resource "gitlab_branch_protection" "maintenance" {
  for_each = var.projects

  project            = gitlab_project.this[each.key].id
  branch             = "*.*.*"
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
}

resource "gitlab_branch_protection" "master" {
  for_each = var.projects

  project            = gitlab_project.this[each.key].id
  branch             = "master"
  allow_force_push   = true
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
}

resource "gitlab_branch_protection" "main" {
  for_each = var.projects

  project            = gitlab_project.this[each.key].id
  branch             = "main"
  allow_force_push   = true
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
}

resource "gitlab_branch_protection" "next" {
  for_each = var.projects

  project            = gitlab_project.this[each.key].id
  branch             = "next"
  allow_force_push   = true
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
}

resource "gitlab_branch_protection" "beta" {
  for_each = var.projects

  project            = gitlab_project.this[each.key].id
  branch             = "beta"
  allow_force_push   = true
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
}

resource "gitlab_branch_protection" "alpha" {
  for_each = var.projects

  project            = gitlab_project.this[each.key].id
  branch             = "alpha"
  allow_force_push   = true
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
}

resource "gitlab_tag_protection" "this" {
  for_each = var.projects

  project             = gitlab_project.this[each.key].id
  tag                 = "*"
  create_access_level = "maintainer"
}
