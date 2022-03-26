# DevOps Challenge - Terraform and AWS EKS

## Introduction

---

This challenge is about creating an AWS EKS cluster in a VPC with Terraform. The full details of the challenge can be found [here](./devops-challenge.md).

## Project Structure

---

This project consists of custom modules written specifically for this challenge. The modules can be found at the `./modules` folder.

## Project Prerequisite

---

Make sure you have Terraform CLI installed on your computer to be able to run the project.
You can follow the instructions [here](https://learn.hashicorp.com/tutorials/terraform/install-cli) to install Terraform CLI.

Verify that Terraform has been installed successfully on your computer by running the command:

```bash
terraform --version
```

If the command above returns the version of the Terraform CLI you installed, you are good to follow the rest of the instructions. If not, you can troubleshoot the issue further to resolve it.

After Terraform has been installed, go to your AWS user account to get your security credentials for programmatic access ([see here](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys)).

For the sake of this project, make sure your user has Administrator privilege so that you would not have issues with permissions. In a real project, the best practice would be to follow the principle of least privilege.

Get the access key and secret key.

## Deploying the Project

---

Update the `main.tf` file at the root folder of the repository with the user credentials you copied in the previous step i.e.

```Bash
provider "aws" {
  region     = "us-west-2"
  access_key = "*********"
  secret_key = "************************"
}
```

You can also specify your preferred region for deployment by changing the region parameter to your desired region.
> **Note:** It is not recommended to save your user credentials in the terraform file and this is just for demo purposes. There are best practices you can follow and one of them is to configure AWS CLI and have Terraform to get your credentials from AWS CLI so that would not have to include it in your Terraform file.

Run the subsequent commands from the root folder of the repository:

```Bash
terraform init
```

This command will initialize Terraform for the project and install all the necessary providers (e.g. AWS) specified in the project.

Then, run the command:

```Bash
terraform plan
```

The `terraform plan` command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure.

Lastly, run:

```Bash
terraform apply
```

This command applies your changes and deploys your resources to AWS. It will prompt you for a confirmation in which you will need to type "yes" to continue.

If you are running the command from a CI/CD pipeline, or if you do not wish to manually confirm the changes, you can append `--auto-approve` flag to automatically approve the changes.

```Bash
terraform apply --auto-approve
```
