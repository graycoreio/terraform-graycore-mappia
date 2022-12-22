variable "values" {
  type        = list(string)
  description = "Helm chart values"
  default     = []
}

variable "host" {
  type        = string
  description = "Magento host to be used by default configuration"
  default = "example.com"
}

variable "name" {
  type        = string
  description = "Helm release name"
  default     = "mappia"
}


variable "use_default_config" {
  type = bool
  description = "Use pre-defined ingress/magento host configuration"
  default = true
}

variable "set_values" {
  type        = map(string)
  description = "Dict of custom values to be merged with the values yaml "
  default     = {}
}
