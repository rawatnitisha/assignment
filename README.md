#  VPC

Configuration in this directory creates set of VPC resources which may be sufficient for development environment.

There are public and private subnet created per availability zone in addition to single NAT Gateway shared between all 3 availability zones.

This configuration uses  Availability Zone names for demonstration purposes. Normally, you need to specify only names or IDs.

Default credentials approach is used to stored environment variables to set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY  for the demostration purpose .

[Read more about AWS regions, availability zones and local zones](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-regions-availability-zones).

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note . Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description |
|------|-------------|
| <a name="vpc_count"></a> [cgw\_arns](#output\_cgw\_arns) | change this to create more than 1 VPC |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cgw_arns"></a> [cgw\_arns](#output\_cgw\_arns) | List of ARNs of Customer Gateway |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
