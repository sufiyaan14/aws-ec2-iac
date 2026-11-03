variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources in"
  default     = "ap-southeast-1"
}

variable "ubuntu26_mumbai_ami_id" {
  type        = string
  description = "Ubuntu 26.04 AMI ID for Mumbai region"
  default     = "ami-0c7632fb77f35db43"
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to launch"
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "Name of the key pair to use for the EC2 instance"
  default     = "DEV-PEM-KP"
}

variable "env" {
  type        = string
  description = "Environment"
}

variable "sg_name" {
  type        = string
  description = "Name of the security group"
  default     = "SG"
}