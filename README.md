# Terraform Gitlab Organization

![pipeline](https://github.com/ckoliber/terraform-gitlab-organization/actions/workflows/cicd.yml/badge.svg)
![release](https://img.shields.io/github/v/release/ckoliber/terraform-gitlab-organization?display_name=tag)
![license](https://img.shields.io/github/license/ckoliber/terraform-gitlab-organization)

**Organization** is a Terraform module useful for creating multiple groups and projects in **Gitlab**

## Installation

Add the required configurations to your terraform config file and install module using command bellow:

```bash
terraform init
```

## Usage

```hcl
module "gitlab" {
  source = "ckoliber/organization/gitlab"

  path = "myorg"
  name = "My Org"
  desc = "My Org Team"

  groups = {
    backend = {
      path = "backend"
      name = "Backend"
      desc = "Backend Team"
    }
    frontend = {
      path = "frontend"
      name = "Frontend"
      desc = "Frontend Team"
    }
  }

  projects = {
    backend1 = {
      path  = "backend1"
      name  = "Backend1"
      desc  = "Backend1 Project"
      group = "backend"
    }
    frontend1 = {
      path  = "frontend1"
      name  = "Frontend1"
      desc  = "Frontend1 Project"
      group = "frontend"
    }
    frontend2 = {
      path  = "frontend2"
      name  = "Frontend2"
      desc  = "Frontend2 Project"
      group = "frontend"
    }
  }
}
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

This project is licensed under the [MIT](LICENSE.md).  
Copyright (c) KoLiBer (koliberr136a1@gmail.com)
