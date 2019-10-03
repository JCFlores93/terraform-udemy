// local 
resource "aws_instance" "firstdemo" {
  ami           = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.firstdemo.private_ip} >> private_ips.txt"
  }
  tags = {
    Name = "threedemoinstance"
  }
}
// remote access
resource "aws_instance" "firstdemo" {
  ami           = "ami-922914f7"
  instance_type = "t2.micro"
  key_name      = "testaccess"
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install http://www.percona.com/downloads/percona-release/redhat/0.1-6/percona-release-0.1-6.noarch.rpm",
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("/tmp/testaccess.pem")}"
    }
  }
}
// File provisioner
resource "null_resource" "cluster" {
  provisioner "file" {
    source      = "/tmp/createtime.log"
    destination = "/tmp/createtime.log"
    connection {
      type        = "ssh"
      host        = "18.191.227.101"
      user        = "ubuntu"
      private_key = "${file("/tmp/testaccess.pem")}"
    }
  }
}
