terraform {
  backend "s3" {
    bucket         = "terraform-state-file-mathanprasath-cogniwide"
    key            = "terraform/vpc/network_a.tfstate"
    region         = "us-east-1"
    dynamodb_table = "DynamoDB_terraform_state_lock"
  }
}