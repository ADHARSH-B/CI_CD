

variable "ami_id" {
  default = "ami-0d70546e43a941d70"
}
variable "subnet_cidrs_public" {
  default = ["10.0.10.0/24", "10.0.20.0/24"]
  type    = list(any)
}
variable "subnet_cidrs_private" {
  default = ["10.0.30.0/24", "10.0.40.0/24"]
  type    = list(any)
}

variable "availability_zones" {
  default = ["us-west-2a", "us-west-2b"]
  type    = list(any)
}

variable "instance_type" {
  description = "instance type for different workspaces"
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t3.medium"
  }
  type = map(any)
}

variable "key_name" {
  default = "terr"
}

variable "vpc_cidr" {
  description = "CIDR for vpc's"
  default     = "10.0.0.0/16"
}



variable "my_ip" {
  description = "Ip address of machine"
  # default     = "120.138.12.231/32"
  default = "103.28.246.253"
}