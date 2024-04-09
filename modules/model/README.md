<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.44.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.44.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sagemaker_model.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_model) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Whether to create the SageMaker model. | `bool` | `true` | no |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | The ARN of the IAM role that SageMaker can assume to access model artifacts and docker images for deployment. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the SageMaker model. | `string` | `null` | no |
| <a name="input_primary_container"></a> [primary\_container](#input\_primary\_container) | Configuration for the primary container. | <pre>object({<br>    image              = optional(string)<br>    mode               = optional(string, "SingleModel")<br>    model_data_url     = optional(string)<br>    model_package_name = optional(string)<br>    model_data_source  = optional(string)<br>    container_hostname = optional(string)<br>    environment        = optional(map(string))<br>    image_config       = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of resource tags | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sagemaker_model_arn"></a> [sagemaker\_model\_arn](#output\_sagemaker\_model\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this model. |
| <a name="output_sagemaker_model_name"></a> [sagemaker\_model\_name](#output\_sagemaker\_model\_name) | The name of the model. |
<!-- END_TF_DOCS -->