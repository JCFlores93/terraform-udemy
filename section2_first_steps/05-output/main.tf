resource "aws_instance" "firstdemo" {
    ami = "ami-0b69ea66ff7391e80"
    instance_type = "t2.micro"
}

output "pubip" {
  value = "${aws_instance.firstdemo.public_ip}"
}
