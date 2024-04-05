data "aws_caller_identity" "current" {}

locals {
  account_id         = data.aws_caller_identity.current.account_id
  region             = "us-east-1"
  model_name         = "california-housing"
  model_version      = 1
  role_name          = "sagemaker-execution"
  role_arn           = "arn:aws:iam::${local.account_id}:role/service-role/${local.role_name}"
  model_package_name = "arn:aws:sagemaker:${local.region}:${local.account_id}:model-package/${local.model_name}/${local.model_version}"
}
