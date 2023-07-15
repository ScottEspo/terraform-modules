<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| aws |  >= 4.57.0 |
| datadog | 3.26.0 |

## Providers

| Name | Version |
|------|---------|
| aws |  >= 4.57.0 |
| aws.aws\_prod |  >= 4.57.0 |
| datadog | 3.26.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.tf_demo_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.tf_demo_instance_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.tf_demo_ssm_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.web_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_lb.tf-demo-lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.front_end](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.tf_demo_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.tf_demo_tg_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_route53_record.tf-demo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.tf-demo_provider_example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.lb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.web_server_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [datadog_monitor.tf_demo_monitor](https://registry.terraform.io/providers/DataDog/datadog/3.26.0/docs/resources/monitor) | resource |
| [aws_ami.amazon](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_iam_policy_document.tf_demo_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_route53_zone.parent_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_subnet.subnet_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnets.internal_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alternate\_hosted\_zone | Hosted Zone where you want to your new site to live | `string` | n/a | yes |
| datadog\_api\_key | DataDog API Key from your Data Dog Account | `string` | n/a | yes |
| datadog\_app\_key | DataDog APP Key from your Data Dog Account | `string` | n/a | yes |
| enable\_monitoring | set this to true if you would like to enable DataDog Monitoring | `bool` | `false` | no |
| environment | environment name | `string` | n/a | yes |
| hosted\_zone | Hosted Zone where you want to your new site to live | `string` | n/a | yes |
| instance\_type | instance type for your ec2 instance | `string` | `"t2.micro"` | no |
| prod\_profile | aws profile to use for PROD account | `any` | n/a | yes |
| profile | aws profile to use | `any` | n/a | yes |
| project | n/a | `string` | n/a | yes |
| tags | tags to be passed in | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| prod\_dns\_example | this is the dns created in prod, but we only want to see it if it was being created |
| web\_page | Web URL of LB |
| web\_server\_instance\_id | instance id of we server created |
<!-- END_TF_DOCS -->