provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}

resource "aws_instance" "example" {
    ami = "${lookup(var.amis, var.region)}"
    instance_type = "t1.micro"

    provisioner "local-exec" {
        command = "echo ${aws_instance.example.public_ip} > file.txt"
    }
}

resource "aws_eip" "ip" {
    instance = "${aws_instance.example.id}"
}

resource "aws_instance" "another" {
    ami = "ami-aa7ab6c2"
    instance_type = "t1.micro"
}

output "ip" {
    value = "${aws_eip.ip.public_ip}"
}

module "consul" {
    source = "github.com/hashicorp/consul/terraform/aws"

    key_name = "${var.key_name}"
    key_path = "${var.key_path}"
    region = "${var.region}"
    servers = "3"
}
