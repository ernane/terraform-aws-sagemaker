variable "create" {
  description = "Whether to create the SageMaker model."
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the SageMaker model."
  type        = string
  default     = null
}

variable "execution_role_arn" {
  description = "The ARN of the IAM role that SageMaker can assume to access model artifacts and docker images for deployment."
  type        = string
}

variable "primary_container" {
  description = "Configuration for the primary container."
  type = object({
    image              = optional(string)
    mode               = optional(string, "SingleModel")
    model_data_url     = optional(string)
    model_package_name = optional(string)
    model_data_source  = optional(string)
    container_hostname = optional(string)
    environment        = optional(map(string))
    image_config       = optional(string)
  })
  default = null
}

variable "tags" {
  description = "Map of resource tags"
  type        = map(any)
  default     = {}
}
