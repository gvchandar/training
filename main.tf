#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-7a27570c
#
# Your security group ID is:
#
#     sg-83f00ae5
#
# Your AMI ID is:
#
#     ami-8328bbf0
#
# Your Identity is:
#
#     hashicorp-training-cfcd208495d565ef66e7dff9f98764da
#

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {
  default = "eu-west-1"
}

provider "aws" {

  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
  #access_key = "AKIAJF6C4WVAWVJWQ2NQ"
  #secret_key = "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"
  #region     = "eu-west-1"
}

# Create a web server
resource "aws_instance" "web" {
  ami = "ami-8328bbf0"
  instance_type = "t2.micro"
  subnet_id = "subnet-7a27570c"
  vpc_security_group_ids = ["sg-83f00ae5"]
  count = 1
  tags  {
       Identity = "hashicorp-training-cfcd208495d565ef66e7dff9f98764da"
       DateOfCreation = "14thOct2016"
       Location = "London"
  }  
}

#module "example" {
#   source = "./example-module"
#    command = "echo Hello from Main"
#}
output "public_dns" {
       value = ["${aws_instance.web.*.public_dns}"]
}
output "public_ip" {
       value = ["${aws_instance.web.*.public_ip}"]
}

Testing synatx erro
