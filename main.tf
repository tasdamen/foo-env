terraform {
    required_version = ">= 0.12, < 0.13"
    backend "remote" {
    hostname = "app.terraform.io"
    organization = "TASDAMEN"

    workspaces {
      name = "foo-env-"
    }
  }
}

provider "aws" {
    region = "us-east-2"
}

module "web_server" {
  source = "./modules/web-server"
  server_port = var.server_port
  server_name = var.server_name
  security_group_name = var.security_group_name
}


