provider "aws" {
  region = var.region
}

resource "aws_security_group" "security" {
  name = var.sg_name
 
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 4500
    to_port = 4500
    protocol = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 500
    to_port = 500
    protocol = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
     
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = var.vpc_id
}

resource "aws_instance" "instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  security_groups = [aws_security_group.security.id]
  associate_public_ip_address = true

  #provisioner "file" {
  #  source      = var.bash
  #  destination = "/tmp/install-vpn.sh"
  #}

  private_ip = var.private_ip
  
  tags = {
    "Name"      = var.ec2_tag_name
  }

#  connection {
#    type        = "ssh"
#    user        = "ubu"
#    password    = ""
#    private_key = file(var.keyPath)
#    host        = self.public_ip
#  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = 8
  }

  key_name  = var.key_pair
}