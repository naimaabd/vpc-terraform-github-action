variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDRs"
  type        = list(string)
}

variable "subnet_names" {
  description = "Subnet names"
  type        = list(string)
  default     = ["PublicSubnet1", "PublicSubnet2"]
}

variable "ec2_names" {
  description = "EC2 names"
  type        = list(string)
  default     = ["WebServer1", "WebServer2"]
}

variable "vpc_id" {
  description = "VPC ID for ALB"
  type        = string
}

variable "instances" {
  description = "Instance IDs for Target Group Attachment"
  type        = list(string)
}
