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
  security_groups = aws_security_group.allow_tls.id

  provisioner "local-exec" {
    #working_dir = "./ansible-first-run"
    command     = "echo ${self.public_ip} >> ./ansible-first-run/hosts"
  }

  tags = {
    Name = "Linux_instance"
  }
}

resource "aws_security_group" "allow_tls" {
  description = "Allow TLS inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id

  tags = {
    Name = "webserver_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = ["0.0.0.0/0"]
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


