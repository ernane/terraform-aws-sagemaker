resource "aws_sagemaker_model" "this" {
  count = var.create ? 1 : 0

  name               = var.name
  execution_role_arn = var.execution_role_arn

  dynamic "primary_container" {
    for_each = var.primary_container != null ? [var.primary_container] : []

    content {
      image              = primary_container.value.image
      mode               = primary_container.value.mode
      model_data_url     = primary_container.value.model_data_url
      model_package_name = primary_container.value.model_package_name
      container_hostname = primary_container.value.container_hostname
      environment        = primary_container.value.environment
    }
  }

  tags = var.tags
}
