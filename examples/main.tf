module "sagemaker" {
  source = "../"

  enable_model = false
  model = {
    name               = local.model_name
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
        model_name = local.model_name
      }
    }
  }

  tags = {
    Environment = "dev"
  }
}
