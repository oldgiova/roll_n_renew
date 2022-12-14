terraform {
  required_providers {
    aws = {
      version = "4.46.0"
      source  = "hashicorp/aws"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "3.20.0"
    }
  }
}
