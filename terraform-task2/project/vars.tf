variable "ACCESS_KEY" {
    type        = string
    description = "This is an example input variable using env variables."
}
variable "SECRET_KEY" {
    type        = string
    description = "This is an example input variable using env variables."
}

variable "RDS_USER" {
  description = "username of the rds"
}
variable "RDS_PASSWORD" {
  description="password of the rds"
}