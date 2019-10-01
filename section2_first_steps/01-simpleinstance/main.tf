resource "aws_instance" "firstdemo" {
  ami = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"

  tags = {
      Name = "demo instance"
  }
}

# provisioner "local-exec" {
#     command = "echo ${aws_instance.firstdemo.private_ip} >> private_ips.txt" 
# }

# variable "name" {
  
# }
