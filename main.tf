#
# https://registry.terraform.io/providers/hashicorp/random/latest
#
resource "random_string" "bucket_name" {
  length = 32
  lower = true
  upper = false
  special = false
}

#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
#
# https://docs.aws.amazon.com/console/s3/bucket-naming
#
resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
  
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


