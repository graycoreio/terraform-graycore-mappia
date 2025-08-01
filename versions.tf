terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.8.0, < 3.0.0"
    }
  }

  required_version = ">= 1.1.0"
}
