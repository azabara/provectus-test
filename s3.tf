terraform {
  backend "s3" {
    bucket = "bucket-of-tulips"
    key    = "path/to/my/key"
    region = "eu-central-1a"
  }
}
