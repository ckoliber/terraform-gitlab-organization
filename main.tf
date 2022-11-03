terraform {
  required_version = ">= 0.14.0"
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.4.0"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 3.16.1"
    }
  }
}
