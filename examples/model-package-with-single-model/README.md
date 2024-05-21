<!-- BEGIN_TF_DOCS -->


### Model Package with Single Model 


## Inputs

No inputs.
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_model"></a> [model](#module\_model) | ../../modules/model | n/a |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sagemaker_model_arn"></a> [sagemaker\_model\_arn](#output\_sagemaker\_model\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this model. |
| <a name="output_sagemaker_model_name"></a> [sagemaker\_model\_name](#output\_sagemaker\_model\_name) | The name of the model. |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
## Requirements

No requirements.
## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
<!-- END_TF_DOCS -->