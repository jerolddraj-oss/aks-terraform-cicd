variable "location" {
  default = "Central India"
}

variable "resource_group_name" {
  default = "aks-rg"
}

variable "cluster_name" {
  default = "jd-aks-cluster"
}

variable "node_count" {
  default = 2
}

variable "vm_size" {
  default = "Standard_B2s_v2"
}

variable "environment" {
  default = "dev"
}