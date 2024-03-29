
variable "aws_key" {
}

variable "aws_secret" {
}

terraform {
  required_version = ">= 0.12"

  # vars are not allowed in this block
  # see: https://github.com/hashicorp/terraform/issues/22088
  backend "s3" {}

  required_providers {
    archive = {
      version = "= 1.3.0"
      source  = "hashicorp/archive"
    }

    local = {
      version = "= 1.4.0"
      source  = "hashicorp/local"
    }

    template = {
      version = "= 2.1.2"
      source  = "hashicorp/template"
    }

    aws = {
      source  = "aws"
      version = "~> 4.0"
    }

    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# The AWS Profile to use
# variable "aws_profile" {
# }

provider "aws" {
  region  = var.region
  {% if assume_role_arn %}
  assume_role {
    role_arn="{{assume_role_arn}}"
    external_id="{{assume_role_external_id}}"
  }
  {% else %}
  access_key = var.aws_key
  secret_key = var.aws_secret
  {% endif %}
}