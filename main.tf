################################################################################################################
# Define the SageMaker Model
################################################################################################################
resource "aws_sagemaker_model" "this" {
  count = var.enable_model ? 1 : 0

  name               = var.model.name
  execution_role_arn = var.model.execution_role_arn

  dynamic "primary_container" {
    for_each = var.model.primary_container != null ? [var.model.primary_container] : []

    content {
      image              = primary_container.value.image
      mode               = primary_container.value.mode
      model_data_url     = primary_container.value.model_data_url
      model_package_name = primary_container.value.model_package_name
      container_hostname = primary_container.value.container_hostname
      environment        = primary_container.value.environment
    }
  }

  dynamic "inference_execution_config" {
    for_each = var.model.inference_execution_config != null ? [var.model.inference_execution_config] : []

    content {
      mode = inference_execution_config.value.mode
    }
  }

  dynamic "container" {
    for_each = var.model.container != null ? [var.model.container] : []

    content {
      image              = container.value.image
      mode               = container.value.mode
      model_data_url     = container.value.model_data_url
      model_package_name = container.value.model_package_name
      container_hostname = container.value.container_hostname
      environment        = container.value.environment
    }
  }

  enable_network_isolation = var.model.enable_network_isolation

  dynamic "vpc_config" {
    for_each = var.model.vpc_config != null ? [var.model.vpc_config] : []

    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnets            = vpc_config.value.subnets
    }
  }

  tags = var.tags
}

################################################################################################################
#  Define the SageMaker Endpoint Configuration
################################################################################################################
resource "aws_sagemaker_endpoint_configuration" "this" {
  count = var.enable_endpoint_configuration ? 1 : 0

  name = var.endpoint.endpoint_configuration.name

  dynamic "production_variants" {
    for_each = var.endpoint.endpoint_configuration.production_variants != null ? [var.endpoint.endpoint_configuration.production_variants] : []

    content {
      accelerator_type                                  = production_variants.value.accelerator_type
      container_startup_health_check_timeout_in_seconds = production_variants.value.container_startup_health_check_timeout_in_seconds
      initial_instance_count                            = production_variants.value.initial_instance_count
      instance_type                                     = production_variants.value.instance_type
      model_name                                        = production_variants.value.model_name
      variant_name                                      = production_variants.value.variant_name
      volume_size_in_gb                                 = production_variants.value.volume_size_in_gb
    }
  }
}
