variable "region" {
  description = "The AWS region."
  default     = "eu-central-1"
}

variable "environment" {
  default     = "base"
  description = "The environment name."
}

variable "prefix" {
     default     = "base"
     description = "The name of our org, i.e. base."
}
