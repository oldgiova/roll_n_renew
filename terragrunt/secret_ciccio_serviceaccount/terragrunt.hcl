locals {
  environment_name = "poc"
}

remote_state {
  backend = "local"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    path = "${get_terragrunt_dir()}/terraform.tfstate"
  }
}

generate "provider" {
  path      = "${get_terragrunt_dir()}/provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "eu-central-1"
  allowed_account_ids = ["869806792472"]
  default_tags {
    tags = {
      TerraformManaged = "yes"
      TerraformEnvironment = "${local.environment_name}"
      TerraformPath = "aws_gitlab/${path_relative_to_include()}"
    }
  }
}

provider "gitlab" {
  token = var.gitlab_pat
}
EOF
}
