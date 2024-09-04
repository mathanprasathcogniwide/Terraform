terraform {
  backend "s3" {
    bucket         = "terraform-state-file-mathanprasath-cogniwide"
    key            = "terraform/ec2/ec2.tfstate"
    region         = "us-east-1"
    dynamodb_table = "DynamoDB_terraform_state_lock"

  }
}