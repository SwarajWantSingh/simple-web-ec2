data "aws_ami" "example" {
  #executable_users = ["self"]
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.20240611.0-kernel-6.1-*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
