# Terraform Beginner Bootcamp 2023

## Table of Contents

- [Semantic Versioning](#semantic-versioning)
- [Installling the Terraform CLI](#installing-the-terraform-cli)
  - [Considerations for Linux Distributions](#considerations-for-linux-distributions)
  


## Semantic Versioning

This project utilizes semantic versioning for its tagging. More info on semantic versioning can be found here: [semver.org](https://semver.org)

The general format **MAJOR.MINOR.PATCH** (e.g. `1.0.1`)

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes


## Installing the Terraform CLI

The Terraform CLI installation instructions have changed due to gpg keyring changes. So we needed to refer to the updated Terraform installation instructions - which lead us to create a new bash install script (install_terraform_cli).

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

This new script [./bin/install_terraform_cli](./bin/install_terraform_cli) allows us to:
- Keep the Gitpod Project File ([.gitpod.yml](.gitpod.yml)) file clean and tidy
- Allow us an easier way to debug if this changes in the future
- Better portability - if other projects need this same code.

### Considerations for Linux Distributions

This project is built using Ubuntu - but you build this against another Linux distribution, please validate the correct way to check your Linux version 

[How to check OS version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line)


### Other considerations
- We added the she-bang (pronounced shah-bang) command to the top of the bash script to ensure that the script could run stand-alone: `#!/usr/bin/env bash`
- We needed to change the Linux permissions to enable execution of the bash script- we did that by: `chmod u+x install_terraform_cli`
- In the gitpod.yml file, we needed to change the Gitpod Lifecycle original `init` command to `before` - the reason being that the `init` command will not rerun if we restart an existing workspace.

### Working with Environmental Variables (Env Vars)

#### env command

We can list all env vars by using the `env` command.
We can search for env vars by using grep, eg: `env | grep AWS_`

#### Settting / unsetting env vars

In the terminal window, we can set using: `export HELLO='world'`
In the terminal window, we can unset using: `unset HELLO`

We can temporarily set an env var when just running a command:
```sh
HELLO='world' ./bin/print_message $HELLO
```

Within a bash script, we can set an env var without using the `export` command:

```sh
#!/usr/bin/env bash
HELLO='world'
echo $HELLO
```

#### Printing Env Vars

We can print an env var: `echo $HELLO`

#### Scoping of Env Vars

If you set env vars in one VSCode terminal, it will not be known/available in another VSCode terminal.

To have env vars be available and persistent across all future terminals, we must set them in the bash profile configuration file: `.bash_profile`

#### Persisting Env Vars in Gitpod

We can persist env vars in Gitpod by storing them in the Gitpod Secrets Storage.

```
gp env HELLO='world'
```

All workspaces launched will set the env vars for all bash terminals opened in those workspaces.

You can also set env vars in the `.gitpod.yml` file, but should only be non-sensitive env vars.

### AWS CLI Installation

AWS CLI is installed for the project via the bash script ['./bin/install_aws_cli'](./bin/install_aws_cli)

[Getting started install](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials are configured correctly by running the following AWSS CLI command:

```sh
aws sts get-caller-identity
```

If successfully logged in, you should see something similar to this:

```json
{
    "UserId": "AIDA2MK8KBUI7U4CXEZN9",
    "Account": "987654321012",
    "Arn": "arn:aws:iam::987654321012:user/tf-bootcamp"
}
```

We'll need to generate AWS CLI credentials from IAM User in order to use the AWS CLI.


### Terraform Basics

Terraform sources their modules and providers from [registry.terraform.io](registry.terraform.io)

- **Providers** are interfaces to APIs which allow you to create/edit/modify resources in TF
- **Modules** are "chunks of code" that perform specific tasks - which are modular, portable and shareable.

#### Terraform Console

You can display a list of all terraform commands by simply typing `terraform`

#### Terraform init

`terraform init`

Prior to starting a terraform project, you will need to do a `terraform init` to download the terraform providers/modules that will be used in your project.

#### Terraform plan

`terraform plan`

This will generate a change set of what the state of our infrastructure and what will be changed/destroyed.

We can output this change set to be passed to an apply, but you can often ignore that.

#### Terraform apply

`terraform apply`

This will run the plan and pass the change set to be executed by TF.  The plan should prompt us 'yes' to approve the apply.

To automatically apply the terraform apply, we can add the `-auto-approve` flag to the terraform apply command:

`terraform apply -auto-approve`

#### Terraform lock file

`.terraform.lock.hcl` contains the locked versioning for the modules / providers that are used with this project.

The Terraform lock file should be commmited to your version control system (e.g. github)


#### Terraform state file

`terraform.tfstate` contains information about the current state of your infrastructure.  This file **should NOT be included** in your version control system.

This file **can** contain sensitive information - if you lose this file, you lose knowing the state of your infrastructure.

`.terraform.tfstate.backup` is the previous state file - so same rules as above apply here.

#### Terraform Directory

`.terraform` directory contains the binaries of TF providers - these are needed for TF to run


#### Terraform Destroy

`terraform destroy` - This will destroy resources that were created in AWS. You can also use the `auto-approve` command here:

`terraform destroy -auto-approve`


### Issues with Terraform Cloud login and Gitpod

When attempting to run `terraform login` it will launch in a WYSIWYG bash window - which doesn't allow you to see it.  It doesn't work as expected.

The workaround is to manually generate an API key in Terraform Cloud. The link to that is here:

```
https://app.terraform.io/app/settings/tokens?source=terraform-login
```

Once you have the key, you can create `/home/gitpod/.terraform.d/credentials.tfrc.json` and paste the following code in that file:

```json
{
  "credentials": {
      "app.terraform.io": {
        "token": "PASTE YOUR API KEY HERE"
    }
  }
}
```

We have automated the tfrc generation workaround here [./bin/generate_tfrc_credentials](./bin/generate_tfrc_credentials) - but things appear to be horribly broken.


