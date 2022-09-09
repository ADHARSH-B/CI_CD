# variable "region" {
#   default = "ap-south-1"
# }

variable "ami_id" {
  #   type = map
  default = "ami-0d70546e43a941d70"
}
variable "subnet_cidrs_public" {
  description = "public subnet cidrs for vpc"
  default = ["10.0.10.0/24", "10.0.20.0/24"]
  type    = list(any)
}
variable "subnet_cidrs_private" {
  description = "private subnet cidrs for vpc"
  default = ["10.0.30.0/24", "10.0.40.0/24"]
  type    = list(any)
}

variable "availability_zones" {
  description = "availability-zones for subnets"
  default = ["us-west-2a", "us-west-2b"]
  type    = list(any)
}

variable "instance_type" {
  description = "instance types for different workspaces."
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t3.medium"
  }
  type = map(any)
}

variable "key_name" {
  description = "key name for ec2 instance"
  default = "terrv1"
}

variable "vpc_cidr" {
  description = "cidrs for vpc's"
  default = "10.0.0.0/16"
}

# variable "pub_subnet_aza_cidr" {

#   default = "10.0.10.0/24"
# }

# variable "pub_subnet_azc_cidr" {
#   default = "10.0.20.0/24"
# }

# variable "pri_subnet_aza_cidr" {
#   default = "10.0.30.0/24"
# }

# variable "pri_subnet_azc_cidr" {
#   default = "10.0.40.0/24"
# }

# variable "password" {
#   type = string
# }