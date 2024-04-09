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
