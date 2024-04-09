output "model_name" {
  description = "The name of the model"
  value       = element(concat(resource.aws_sagemaker_model.this[*].name, [""]), 0)
}

output "model_arn" {
  description = "The ARN of the model"
  value       = element(concat(resource.aws_sagemaker_model.this[*].arn, [""]), 0)
}

output "endpoint_configuration_name" {
  description = "The name of the endpoint configuration"
  value       = element(concat(resource.aws_sagemaker_endpoint_configuration.this[*].name, [""]), 0)
}
