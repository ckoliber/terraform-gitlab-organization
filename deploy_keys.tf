resource "gitlab_deploy_key" "this" {
  for_each = {
    for item in flatten([
      for k1, v1 in var.repositories : [
        for k2, v2 in v1.deploy_keys : {
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

  project  = gitlab_project.this[each.value.repository].id
  key      = each.value.val.key
  title    = each.value.val.title
  can_push = each.value.val.push
}
