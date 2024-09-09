terraform {
  backend "s3" {
    bucket         = "terraform-state-file-mathanprasath-cogniwide"
    key            = "terraform/vpc/vpc_peering.tfstate"
    region         = "us-east-1"
    dynamodb_table = "DynamoDB_terraform_state_lock"
  }
}

data "terraform_remote_state" "network_a" {
  backend = "s3"

  config = {
    bucket         = "terraform-state-file-mathanprasath-cogniwide"
    key            = "terraform/vpc/network_a.tfstate"
    region         = "us-east-1"
    dynamodb_table = "DynamoDB_terraform_state_lock"
  }
}

data "terraform_remote_state" "network_b" {
  backend = "s3"

  config = {
    bucket         = "terraform-state-file-mathanprasath-cogniwide"
    key            = "terraform/vpc/network_b.tfstate"
    region         = "us-east-1"
    dynamodb_table = "DynamoDB_terraform_state_lock"
  }
}

