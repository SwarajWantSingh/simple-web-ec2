terraform {
  required_version = ">=1.8.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}