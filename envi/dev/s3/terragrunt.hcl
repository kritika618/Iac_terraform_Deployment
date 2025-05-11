module "s3_bucket" {
  source = "git::https://github.com/kritika618/terraform_new_modules.git//.modules/aws/s3"

  bucket                    = "my-s3-bucket-dev"
  acl                       = "private"
  control_object_ownership  = true
  object_ownership          = "ObjectWriter"

  versioning = {
    enabled = true
  }
}
