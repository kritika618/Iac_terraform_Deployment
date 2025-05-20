terraform {
  source = "git::https://github.com/kritika618/terraform_new_modules.git//.modules/aws/s3"
}

inputs = {
  bucket_name = "my-s3-bucket-dev-1"
  acl         = "private"
  tags = {
    Environment = "dev"
    Owner       = "dev-team"
  }
}
