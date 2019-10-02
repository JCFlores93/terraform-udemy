resource "aws_instance" "firstdemo" {
  ami = "${lookup(var.amitype, var.region)}"
  security_groups = "${var.sgs}"
  instance_type = "${lookup(var.instance_type, var.env)}"

  tags = {
      Name = "demo-instance"
  }
}