variable "enable_model" {
  description = "Enable sagemaker model usage"
  type        = bool
  default     = false
}

variable "model" {
  description = "Map of model parameters"
  type = object({
    name               = optional(string)
    execution_role_arn = string

    primary_container = optional(object({
      image              = optional(string)
      mode               = optional(string, "SingleModel")
      model_package_name = optional(string)
    }))

    inference_execution_config = optional(object({
      mode = string
    }))

    container = optional(object({
      image              = optional(string)
      mode               = optional(string, "SingleModel")
      model_package_name = optional(string)
    }))

    enable_network_isolation = optional(bool)

    vpc_config = optional(object({
      security_group_ids = list(string)
      subnets            = list(string)
    }))
  })

  validation {
    condition     = contains(["SingleModel", "MultiModel"], lookup(var.model, "container") != null ? lookup(var.model.container, "mode", "SingleModel") : "SingleModel")
    error_message = "expected container.mode to be one of [\"SingleModel\" \"MultiModel\"]"
  }

  validation {
    condition     = contains(["SingleModel", "MultiModel"], lookup(var.model, "primary_container") != null ? lookup(var.model.primary_container, "mode", "SingleModel") : "SingleModel")
    error_message = "expected primary_container.mode to be one of [\"SingleModel\" \"MultiModel\"]"
  }
}

variable "enable_endpoint_configuration" {
  description = "Enable sagemaker endpoint configuration usage"
  type        = bool
  default     = false
}

variable "endpoint" {
  description = "Map of endpoint parameters"
  default = {
    endpoint_configuration = {
      production_variants = {
        model_name = "california-housing"
      }
    }
  }

  type = object({
    endpoint_configuration = object({
      production_variants = object({
        accelerator_type                                  = optional(string)
        container_startup_health_check_timeout_in_seconds = optional(number)
        initial_instance_count                            = optional(number, 1)
        instance_type                                     = optional(string, "ml.m5.large")
        model_name                                        = string
        variant_name                                      = optional(string, "AllTraffic")
      })
    })
  })
}

variable "tags" {
  description = "Map of resource tags"
  type        = map(any)
}
