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
