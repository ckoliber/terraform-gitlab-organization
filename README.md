# Terraform Gitlab Organization

![pipeline](https://github.com/cktf/terraform-gitlab-organization/actions/workflows/cicd.yml/badge.svg)
![release](https://img.shields.io/github/v/release/cktf/terraform-gitlab-organization?display_name=tag)
![license](https://img.shields.io/github/license/cktf/terraform-gitlab-organization)

**Organization** is a Terraform module useful for creating multiple subgroups and projects in **Gitlab**

## Installation

Add the required configurations to your terraform config file and install module using command bellow:

```bash
terraform init
```

## Usage

```hcl
module "organization" {
  source = "cktf/organization/gitlab"

  group_id    = "<PARENT_GROUP_ID>"
  path        = "myapp"
  name        = "My Organization"
  description = "My Organization Group"
  projects = {
    react = {
      name        = "React"
      description = "React Project"
    }
    nodejs = {
      name        = "NodeJS"
      description = "NodeJS Project"
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
