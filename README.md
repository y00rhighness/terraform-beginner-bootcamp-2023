# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

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
