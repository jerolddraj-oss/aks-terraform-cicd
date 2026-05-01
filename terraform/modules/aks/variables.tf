variable "cluster_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "dns_prefix" {}

variable "kubernetes_version" {
  default = "1.29.2"
}

variable "node_count" {
  default = 2
}

variable "vm_size" {
  default = "Standard_DS2_v2"
}

variable "subnet_id" {}

variable "log_analytics_workspace_id" {}

variable "tags" {
  type = map(string)
}