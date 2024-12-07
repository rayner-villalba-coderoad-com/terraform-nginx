terraform {
  backend "s3" {
    bucket         = "upb-devops2024-terraform"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "upb-devops2024-tfstate-locking"
    encrypt        = true
  }
}