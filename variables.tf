variable "project_name" {
  description = "The name for the project"
  type        = string
}

variable "organization_id" {
  description = "The organization ID."
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}

variable "network" {
  type        = string
  description = "The VPC network to host the cluster in"
  default     = "k8s-vpc"
}

variable "subnet" {
  type        = string
  description = "The subnetwork to host the cluster in"
  default     = "k8s-subnet"
}

variable "subnet_ip" {
  type        = string
  description = "The IP and CIDR range of the subnet being created"
  default     = "10.128.0.0/20"
}
