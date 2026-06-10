terraform {
    backend "s3" {
        bucket = "terraform-iac-akshatha-2026"
        region = "us-west-2"
        key = "infra/terraform.tfstate"
        dynamodb_table = "terraform-state-lock"
        encrypt = true
    }
}