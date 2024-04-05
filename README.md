# terraform-aws-sagemaker

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Example

```hcl
module "sagemaker" {
  source = "../"

  enable_model = false
  model = {
    name               = "california-housing"
    execution_role_arn = local.role_arn

    container = {
      mode               = "SingleModel"
      model_package_name = local.model_package_name
    }
  }

  enable_endpoint_configuration = false
  endpoint = {
    endpoint_configuration = {
      production_variants = {
        model_name = "california-housing"
      }
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_endpoint_configuration"></a> [enable\_endpoint\_configuration](#input\_enable\_endpoint\_configuration) | Enable sagemaker endpoint configuration usage | `bool` | `false` | no |
| <a name="input_enable_model"></a> [enable\_model](#input\_enable\_model) | Enable sagemaker model usage | `bool` | `false` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Map of endpoint parameters | <pre>object({<br>    endpoint_configuration = object({<br>      production_variants = object({<br>        accelerator_type                                  = optional(string)<br>        container_startup_health_check_timeout_in_seconds = optional(number)<br>        initial_instance_count                            = optional(number, 1)<br>        instance_type                                     = optional(string, "ml.m5.large")<br>        model_name                                        = string<br>        variant_name                                      = optional(string, "AllTraffic")<br>      })<br>    })<br>  })</pre> | <pre>{<br>  "endpoint_configuration": {<br>    "production_variants": {<br>      "model_name": "california-housing"<br>    }<br>  }<br>}</pre> | no |
| <a name="input_model"></a> [model](#input\_model) | Map of model parameters | <pre>object({<br>    name               = optional(string)<br>    execution_role_arn = string<br><br>    primary_container = optional(object({<br>      image              = optional(string)<br>      mode               = optional(string, "SingleModel")<br>      model_package_name = optional(string)<br>    }))<br><br>    inference_execution_config = optional(object({<br>      mode = string<br>    }))<br><br>    container = optional(object({<br>      image              = optional(string)<br>      mode               = optional(string, "SingleModel")<br>      model_package_name = optional(string)<br>    }))<br><br>    enable_network_isolation = optional(bool)<br><br>    vpc_config = optional(object({<br>      security_group_ids = list(string)<br>      subnets            = list(string)<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of resource tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_model_arn"></a> [model\_arn](#output\_model\_arn) | The ARN of the model |
| <a name="output_model_name"></a> [model\_name](#output\_model\_name) | The name of the model |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
