# variable "region" {
#   default = "ap-south-1"
# }

# variable "ami_id" {
#   type = map
#   default = "ami-0d70546e43a941d70"
# }


variable "availability_zones" {
  description = "availablity_zones of the subnets"
  default     = ["us-west-2a", "us-west-2b"]
  type        = list(any)
}

variable "subnet_ids" {
  description = "subnet_id's for the launch of ec2"
}

variable "my_ip" {
  description = "Ipaddress of the machine"
  default     = "120.138.12.231/32"
}
variable "instance_type" {
  description = "instance_type for different workspaces"
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t3.medium"
  }
  type = map(any)
}

variable "key_name" {
  description = "key_pair name of the ec2"
  default     = "terrv1"
}

variable "vpc_cidr" {
  description = "CIDR for the vpc's"
  default     = "10.0.0.0/16"
}

# variable "pub_subnet_aza_cidr" {
#   description = "CIDR for "
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

variable "vpc__id" {
  description = "vpc id of the ec2 to be launched"
}

variable "ec2_type" {
  description = "ec2 launch type"
}

variable "ec2_count" {
  description = "Number of ec2 need to be launched"
}

variable "rds_user" {
  description = "username of the database"
}

variable "rds_password" {
  description = "password of the database"
}

variable "rds_endpoint" {
}

variable "ec2_ami" {

}

# variable "password" {
#   type = string
# }