variable "project_name" {
  description = "The name for the project (required)"
  type        = string
}

variable "organization_id" {
  description = "The organization ID (required)"
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with (required)"
  type        = string
}

variable "network" {
  type        = string
  description = "The VPC network to host the cluster in (required)"
  default     = "k8s-vpc"
}

variable "subnet" {
  type        = string
  description = "The subnetwork to host the cluster in (required)"
  default     = "k8s-subnet"
}

variable "subnet_ip" {
  type        = string
  description = "The IP and CIDR range of the subnet being created (required)"
  default     = "10.128.0.0/20"
}

variable "region" {
  type        = string
  description = "The region to deploy the resources in (required)"
}
