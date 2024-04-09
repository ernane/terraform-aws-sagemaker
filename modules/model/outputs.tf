output "sagemaker_model_arn" {
  description = "The Amazon Resource Name (ARN) assigned by AWS to this model."
  value       = try(aws_sagemaker_model.this[0].arn, "")
}

output "sagemaker_model_name" {
  description = "The name of the model."
  value       = try(aws_sagemaker_model.this[0].name, "")
}
