provider "aws" {
  region  = "${var.region}"
  profile = "${var.profile}"
  version = "~> 2.4"
}

provider "template" {
  version = "~> 2.1"
}

resource "aws_key_pair" "gobug" {
  key_name   = "gobug"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "gobug" {
  name        = "gobug"
  description = "Security group for gobug test."

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "gobug" {
  instance_type     = "${var.instance_type}"
  availability_zone = "${var.availability_zone}"

  ami = "${var.ami}"

  key_name        = "${aws_key_pair.gobug.key_name}"
  security_groups = ["${aws_security_group.gobug.name}"]

  root_block_device {
    volume_size = 32
  }
}
