output "model_name" {
  description = "The name of the model"
  value       = module.sagemaker.model_name
}

output "model_arn" {
  description = "The ARN of the model"
  value       = module.sagemaker.model_arn
}
