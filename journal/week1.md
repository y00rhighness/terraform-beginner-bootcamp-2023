# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follows:

```
PROJECT_ROOT
│
├── main.tf                 # Everything else
├── variables.tf            # Where we store the structure of our input variables
├── terraform.tfvars        # The actual data of variables we want loaded into our TF project
├── providers.tf            # Required providers and their configuration
├── outputs.tf              # Where we keep the outputs
└── README.md               # REQUIRED for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables

### Terraform Cloud Variables

In TF we can set two kind of variables:
- Enviroment Variables - You would typically set these in your bash terminal eg. AWS credentials
- Terraform Variables - Variables that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown visibliy in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_ud="my-user_id"`

### var-file flag

- TODO: document this flag

### terraform.tvfars

This is the default file to load in terraform variables in blunk

### auto.tfvars

- TODO: document this functionality for TF cloud

### order of terraform variables

- TODO: document which TF variables takes presendence.

## Dealing With Configuration Drift

## What happens if we lose/delete our state file?

If you lose/delete your statefile, you will most likley need to tear down all your cloud infrastructure manually.

You can use TF port, but it doesn't work for *ALL* cloud resources. You'll need check the TF providers documentation to see which resources support import.

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration

If someone deletes/modifies a cloud resource manually via ClickOps, we can run TF plan to *attempt* to put our infrastructure back into the expected state.
