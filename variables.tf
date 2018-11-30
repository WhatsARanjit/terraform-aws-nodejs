# The following are required but for security should be set as environment vars:
# AWS_ACCESS_KEY_ID
# AWS_DEFAULT_REGION
# AWS_SECRET_ACCESS_KEY
variable "aws_region" {
  default = "us-east-1"
}

variable "prefix" {
  description = "Prefix to make resources unique"  
}

variable "ssh_key_name" {
  description = "Existing AWS key to be associated with Vault and consumer instances"
}

variable "owner_tag" {
  description = "Tag identifying instance owner"
  default     = "vault-aws-test"
}

variable "ttl_tag" {
  description = "TTL tracking tag for custom management"
  default     = "24"
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is RHEL 7.5 base image"
  default     = "ami-6871a115"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "iam_role" {
  default = "Ranjit-20180814182034581200000006"
}

variable "security_group_id" {
  description = "Security group ID set by admins"
  default = ""
}

variable "vault_ip" {
  description = "IP of local Vault server"
  default = ""  
}
