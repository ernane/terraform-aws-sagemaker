output "sagemaker_model_arn" {
  description = "The Amazon Resource Name (ARN) assigned by AWS to this model."
  value       = module.model.sagemaker_model_arn
}

output "sagemaker_model_name" {
  description = "The name of the model."
  value       = module.model.sagemaker_model_name
}
