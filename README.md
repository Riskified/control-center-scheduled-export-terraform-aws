## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.r](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_ip_ranges"></a> [allowed\_ip\_ranges](#input\_allowed\_ip\_ranges) | A list of IP ranges that are allowed to assume the role. | `list(string)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the IAM role. | `string` | `"test"` | no |
| <a name="input_iam_role_assume_role_arn"></a> [iam\_role\_assume\_role\_arn](#input\_iam\_role\_assume\_role\_arn) | The ARN of the role that can assume this role. | `string` | `"arn:aws:iam::164676829276:role/k8s-production-cortex-control-center-role"` | no |
| <a name="input_iam_role_external_id"></a> [iam\_role\_external\_id](#input\_iam\_role\_external\_id) | The external ID to use in the assume role policy. | `string` | `"123468456"` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | The ARN of the KMS key to use in the IAM role policy. | `string` | `null` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | The maximum session duration for the IAM role. | `number` | `3600` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the IAM role. | `string` | `"test"` | no |
| <a name="input_path"></a> [path](#input\_path) | The path in which to create the IAM role. | `string` | `"/"` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | A list of inline policies to attach to the IAM role. | <pre>list(object({<br>    name       = string<br>    policy_arn = string<br>  }))</pre> | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | The region in which the resources will be created. | `string` | `"us-east-1"` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | The name of the S3 bucket to use in the IAM role policy. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources. | `map(string)` | `{}` | no |

## Outputs

No outputs.
