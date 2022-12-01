variable "values" {
  type        = list(string)
  description = "Helm chart values"
}

variable "host" {
  type        = string
  description = "Magento host"
}

variable "name" {
  type        = string
  description = "Helm release name"
  default     = "mappia"
}

variable "set_values" {
  type        = map(string)
  description = "Dict of custom values to be merged with the values yaml "
  default     = {}
}
