terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "remote" {
    organization = "clement-martzloff"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}