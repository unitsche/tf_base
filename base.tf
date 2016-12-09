/* This is a multi-line comment. This is a multi-line comment.
   This is a multi-line comment. This is a multi-line comment. This
    is a multi-line comment. This is a multi-line comment. */

provider "aws" {
     region     = "${var.region}"
}

data "terraform_remote_state" "web" {
  backend = "s3"
  config {
    region = "${var.region}"
    bucket = "base-remote-state-base"
    key    = "terraform.tfstate"
  } 
}


module "remote_state" {
     source = "github.com/unitsche/tf_remote_state.git"
     prefix      = "${var.prefix}"
     environment = "${var.environment}"
}

# This is a single-line comment.
resource "aws_instance" "base" {
  ami           = "ami-8504fdea"
  instance_type = "t2.micro"
}

resource "aws_eip" "base" {
  instance = "${aws_instance.base.id}"
}
