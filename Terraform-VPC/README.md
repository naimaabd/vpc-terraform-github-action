# Terraform VPC Deployment with GitHub Actions

## Overview

This Terraform project automates the deployment of a Virtual Private Cloud (VPC) infrastructure on AWS. It orchestrates the creation of essential networking components like subnets, security groups, EC2 instances, and Application Load Balancer (ALB). With the integration of GitHub Actions, the entire deployment process becomes automated. Once triggered, GitHub Actions will automatically deploy the infrastructure on AWS, streamlining the deployment workflow.

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) ~> 0.12
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials

## Features

- **Modular Structure**: The project is organized into reusable modules for VPC, subnets, security groups, EC2 instances, and ALB.
- **Customizable Configuration**: Easily configure VPC CIDR range, subnet CIDRs, instance details, and more through input variables.
- **Infrastructure as Code (IaC)**: Define your AWS infrastructure in code, enabling versioning, reproducibility, and collaboration.
- **GitHub Actions Automation**: Utilizes GitHub Actions for continuous integration and deployment (CI/CD), enabling automated testing and infrastructure updates.
- **Automatic Documentation**: Automatically generated Terraform documentation using `terraform-docs`, providing detailed insights into resources and inputs.

## Modules

- **vpc**: Creates the VPC and associated resources.
- **subnets**: Sets up public subnets within the VPC.
- **sg**: Configures security groups for EC2 instances.
- **ec2**: Launches EC2 instances with Nginx serving a sample webpage.
- **alb**: Deploys an Application Load Balancer (ALB) to distribute traffic to EC2 instances.

## Usage

1. **Installation**: Install Terraform and AWS CLI on your local machine.
2. **Configuration**: Set up your AWS credentials and customize the `terraform.tfvars` file with the desired configurations.
3. **Deployment**: Run `terraform init` followed by `terraform apply` to deploy the infrastructure.
4. **Access**: Access your web application via the ALB URL or EC2 instance public IPs.

## GitHub Actions

The project utilizes GitHub Actions workflows for automation:

- **Terraform CI/CD Pipeline**: Automatically triggers on pushes to the main branch, validating Terraform configuration, and deploying changes to AWS.
- **Destroy Workflow**: Provides a manual trigger option to destroy all resources quickly when needed.

## Inputs

- **ec2_names**: Names of the EC2 instances.
- **instances**: List of instance IDs for ALB target group attachment.
- **subnet_cidr**: CIDR blocks for subnets.
- **subnet_names**: Names of the subnets.
- **vpc_cidr**: CIDR block for the VPC.
- **vpc_id**: ID of the VPC associated with ALB.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ec2_names"></a> [ec2\_names](#input_ec2_names) | EC2 names | `list(string)` | <pre>[<br>  "WebServer1",<br>  "WebServer2"<br>]</pre> | no |
| <a name="input_instances"></a> [instances](#input_instances) | Instance IDs for Target Group Attachment | `list(string)` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input_subnet_cidr) | Subnet CIDRs | `list(string)` | n/a | yes |
| <a name="input_subnet_names"></a> [subnet\_names](#input_subnet_names) | Subnet names | `list(string)` | <pre>[<br>  "PublicSubnet1",<br>  "PublicSubnet2"<br>]</pre> | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input_vpc_cidr) | VPC CIDR Range | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input_vpc_id) | VPC ID for ALB | `string` | n/a | yes |


## Outputs

- No outputs currently defined.

## GitHub Actions
The project utilizes GitHub Actions workflows for automation:

Terraform CI/CD Pipeline: Automatically triggers on pushes to the main branch, validating Terraform configuration, and deploying changes to AWS.
Destroy Workflow: Provides a manual trigger option to destroy all resources quickly when needed.
Terraform Deployment Workflow
The Terraform deployment workflow is defined in the .github/workflows/deploy.yml file. It automates the deployment process by running Terraform commands to initialize, plan, apply, and optionally destroy the infrastructure.

For detailed implementation, refer to the [deploy.yml file](https://github.com/naimaabd/vpc-terraform-github-action/blob/main/.github/workflows/deploy.yml).

