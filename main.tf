terraform {
  required_version = ">= 0.14.0"
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 3.16.1"
    }
  }
}
