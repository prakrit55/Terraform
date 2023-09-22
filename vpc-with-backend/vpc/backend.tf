terraform {
    backend "s3" {
    bucket         = "buckets3formyerrrstatedemo"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    }
}