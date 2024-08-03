provider "aws" {
  region     = var.region
}

resource "local_file" "foo" {
  content  = "[instance]\n"
  filename = "./ansible-first-run/hosts"
}

resource "aws_instance" "myec2" {
  ami = data.aws_ami.example.image_id
  #ami = "ami-0e670eb768a5fc3d4"
  instance_type = var.instance_type["linux"]
  key_name      = var.ssh_key_name

  provisioner "local-exec" {
    #working_dir = "./ansible-first-run"
    command     = "echo ${self.public_ip} >> ./ansible-first-run/hosts"
  }

  tags = {
    Name = "Linux_instance"
  }
}

#resource "aws_security_group" ""
#}


