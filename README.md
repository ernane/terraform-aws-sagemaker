# AWS Sagemaker Terraform module

Terraform module which creates Sagemaker resources on AWS.

## Usage

<!-- BEGIN_TF_DOCS -->


### Model Package with Single Model 

```hcl
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
  model_name = "california-housing"
}

module "model" {
  source = "../../modules/model"

  create             = true
  name               = local.model_name
  execution_role_arn = "arn:aws:iam::${local.account_id}:role/service-role/sagemaker-execution"

  primary_container = {
    model_package_name = "arn:aws:sagemaker:${local.region}:${local.account_id}:model-package/${local.model_name}/1"
  }

  tags = {
    Model = local.model_name
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_endpoint_configuration"></a> [enable\_endpoint\_configuration](#input\_enable\_endpoint\_configuration) | Enable sagemaker endpoint configuration usage | `bool` | `false` | no |
| <a name="input_enable_model"></a> [enable\_model](#input\_enable\_model) | Enable sagemaker model usage | `bool` | `false` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Map of endpoint parameters | <pre>object({<br>    endpoint_configuration = object({<br>      name = optional(string)<br><br>      production_variants = object({<br>        accelerator_type                                  = optional(string)<br>        container_startup_health_check_timeout_in_seconds = optional(number)<br>        initial_instance_count                            = optional(number, 1)<br>        instance_type                                     = optional(string, "ml.t2.medium")<br>        model_name                                        = string<br>        variant_name                                      = optional(string, "AllTraffic")<br>        volume_size_in_gb                                 = optional(number)<br>      })<br>    })<br>  })</pre> | <pre>{<br>  "endpoint_configuration": {<br>    "production_variants": {<br>      "model_name": "california-housing"<br>    }<br>  }<br>}</pre> | no |
| <a name="input_model"></a> [model](#input\_model) | Map of model parameters | <pre>object({<br>    name               = optional(string)<br>    execution_role_arn = string<br><br>    primary_container = optional(object({<br>      image              = optional(string)<br>      mode               = optional(string, "SingleModel")<br>      model_data_url     = optional(string)<br>      model_package_name = optional(string)<br>      model_data_source  = optional(string)<br>      container_hostname = optional(string)<br>      environment        = optional(map(string))<br>      image_config       = optional(string)<br>    }))<br><br>    inference_execution_config = optional(object({<br>      mode = string<br>    }))<br><br>    container = optional(object({<br>      image              = optional(string)<br>      mode               = optional(string, "SingleModel")<br>      model_data_url     = optional(string)<br>      model_package_name = optional(string)<br>      model_data_source  = optional(string)<br>      container_hostname = optional(string)<br>      environment        = optional(map(string))<br>      image_config       = optional(string)<br>    }))<br><br>    enable_network_isolation = optional(bool)<br><br>    vpc_config = optional(object({<br>      security_group_ids = list(string)<br>      subnets            = list(string)<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of resource tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_configuration_name"></a> [endpoint\_configuration\_name](#output\_endpoint\_configuration\_name) | The name of the endpoint configuration |
| <a name="output_model_arn"></a> [model\_arn](#output\_model\_arn) | The ARN of the model |
| <a name="output_model_name"></a> [model\_name](#output\_model\_name) | The name of the model |
<!-- END_TF_DOCS -->