variable "profile" {
  description = "The AWS profile for getting the access code and secret key."
  default     = "default"
}

variable "region" {
  description = "The AWS region to create resources in."
  default     = "eu-west-1"
}

variable "availability_zone" {
  description = "The availability zone"
  default     = "eu-west-1b"
}

variable "ami" {
  default = "ami-02abf8ca2a3672838"
}
