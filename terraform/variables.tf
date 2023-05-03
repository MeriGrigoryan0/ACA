# Define variables
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "region" {
  description = "Region to launch infrastructure"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instance"
  default     = "ami-007855ac798b5175e"
}

variable "key_name" {
	default = "Key"
  description = "Name of the EC2 key pair to use for SSH access"

}
