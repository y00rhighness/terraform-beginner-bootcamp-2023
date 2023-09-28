output "bucket_name" {
  description = "The bucket name for our static website hosting"
  value = module.terrahouse_aws.bucket_name
}
