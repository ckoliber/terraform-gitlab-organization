resource "gitlab_project" "this" {
  for_each = var.repositories

  namespace_id = gitlab_group.this[each.value.team].id
  path         = split("_", each.key)[length(split("_", each.key)) - 1]
  name         = each.value.name
  description  = each.value.description

  visibility_level = "private"
  squash_option    = "always"
  merge_method     = "ff"
  ci_config_path   = ".gitlab/.gitlab-ci.yml"

  initialize_with_readme                           = false
  shared_runners_enabled                           = true
  merge_requests_enabled                           = true
  remove_source_branch_after_merge                 = true
  allow_merge_on_skipped_pipeline                  = true
  only_allow_merge_if_pipeline_succeeds            = true
  only_allow_merge_if_all_discussions_are_resolved = true
}

resource "gitlab_project_access_token" "this" {
  for_each = var.repositories

  project = gitlab_project.this[each.key].id
  name    = "Release Bot"
  scopes  = ["api"]
}

resource "gitlab_project_variable" "token" {
  for_each = var.repositories

  project           = gitlab_project.this[each.key].id
  environment_scope = "*"
  key               = "GITLAB_TOKEN"
  value             = gitlab_project_access_token.this[each.key].token
  masked            = true
  protected         = true
  variable_type     = "env_var"
}
