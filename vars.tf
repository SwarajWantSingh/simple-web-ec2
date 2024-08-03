variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  type = map(string)
}

variable "ssh_key_name" {}
