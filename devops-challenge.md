# DevOps Challenge

This challenge is designed to test your level of familiarity with Infrastructure as Code (IaC) and AWS concepts.

## Task

You must use either Terraform, AWS CloudFormation or AWS CDK for all of the following tasks.

- Create code for deploying a VPC in AWS with 2 public and 2 private subnets.

- Create code for deploying an EKS cluster in AWS, which will use the VPC created in the previous step. The cluster must have 2 nodes, using instance type `t3a.large`. The nodes must be on the private subnets only.

- Add a `README.md` to the root directory of your project, with instructions for the team to deploy the infrastructure you created.

- Publish your code to a public Git repository in a platform of your choice (e.g. GitHub, GitLab, Bitbucket, etc.), so that it can be cloned and tested.

## Important

Your task will be considered successful if another engineer is able to deploy your infrastructure to an AWS account.

Imagine that someone with less experience than you will need to clone your repository and deploy your infrastructure. With that in mind, you must provide ALL the instructions they will need to do that successfully.
These must include any prerequisites for deployment, mention of needed tools and links to their installation pages, how to configure credentials for the tool of your choice, and what commands to run for deploying your code to AWS.

We want to see your ability to properly document and communicate about your work with the team.

- Code quality and style: your code must be easy for others to read, and properly documented when relevant.
