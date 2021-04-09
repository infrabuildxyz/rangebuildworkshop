terraform {
  backend "s3" {
    bucket         = "workshopstate"
    key            = "state"
    region         = "us-east-1"
    dynamodb_table = "workshoptable"
  }
}
