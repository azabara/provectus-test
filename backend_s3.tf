terraform {
  backend "s3" {
    bucket = "bucket-of-tulips"
    key    = "global/s3/terrafrom.tfstate"
    region = "eu-central-1a"
    dynamodb_table = "tf-be"
    encrypt = "true"
  }
}
