resource "gitlab_project" "this" {
  for_each = var.projects

  path         = each.value.path
  name         = each.value.name
  description  = each.value.desc
  namespace_id = try(gitlab_group.this[each.value.group].id, local.org_id)

  visibility_level = "private"
  ci_config_path   = ".gitlab/.gitlab-ci.yml"
  squash_option    = "default_off"
  merge_method     = "merge"

  archive_on_destroy                               = true
  initialize_with_readme                           = false
  shared_runners_enabled                           = true
  merge_requests_enabled                           = true
  remove_source_branch_after_merge                 = true
  allow_merge_on_skipped_pipeline                  = true
  only_allow_merge_if_pipeline_succeeds            = false
  only_allow_merge_if_all_discussions_are_resolved = true

  container_expiration_policy {
    enabled         = true
    cadence         = "1d"
    keep_n          = 10
    older_than      = "14d"
    name_regex_keep = "cache"
  }
}

resource "gitlab_tag_protection" "this" {
  for_each = var.projects

  project             = gitlab_project.this[each.key].id
  tag                 = "*"
  create_access_level = "maintainer"
}

resource "gitlab_branch_protection" "this" {
  for_each = {
    for item in flatten([
      for key, val in var.projects : [
        for branch in ["*.*", "*.*.*", "master", "stable", "next"] : {
          key = "${key}_${branch}"
          value = {
            project = key
            branch  = branch
          }
        }
      ]
    ]) : item.key => item.value
  }

  project            = gitlab_project.this[each.value.project].id
  branch             = each.value.branch
  allow_force_push   = false
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
}

resource "gitlab_project_job_token_scopes" "this" {
  for_each = var.projects

  project = gitlab_project.this[each.key].id
  target_group_ids = [
    for key in var.projects[each.key].readers : gitlab_group.this[replace(key, "group:", "")].id
    if startswith(key, "group:")
  ]
  target_project_ids = [
    for key in var.projects[each.key].readers : gitlab_project.this[replace(key, "project:", "")].id
    if startswith(key, "project:")
  ]
}

resource "gitlab_project_variable" "this" {
  for_each = {
    for item in flatten([
      for key, val in var.projects : [
        for xkey, xval in val.variables : {
          key = "${key}_${xkey}"
          value = {
            project = key
            xkey    = xkey
            xval    = xval
          }
        }
      ]
    ]) : item.key => item.value
  }

  project           = gitlab_project.this[each.value.project].id
  environment_scope = coalesce(each.value.xval.scope, "*")
  key               = each.value.xkey
  value             = each.value.xval.value
  masked            = can(regex("\\A\\w{8,}\\z", each.value.xval.value))
  protected         = each.value.xval.scope != null
  variable_type     = each.value.xval.type
}

resource "gitlab_deploy_key" "this" {
  for_each = {
    for item in flatten([
      for key, val in var.projects : [
        for xkey, xval in val.deploy_keys : {
          key = "${key}_${xkey}"
          value = {
            project = key
            xkey    = xkey
            xval    = xval
          }
        }
      ]
    ]) : item.key => item.value
  }

  project  = gitlab_project.this[each.value.project].id
  key      = each.value.xval.key
  title    = each.value.xval.title
  can_push = each.value.xval.push
}
