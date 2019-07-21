provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "us-west-1"
}
variable "us-east-zones" {
  default = ["us-east-1a", "us-east-1b"]
}
variable "us-west-zones" {
  default = ["us-west-1a", "us-west-1b"	]
}

resource "aws_instance" "frontend" {
    provider = "aws.us-east-1"
    ami	= "ami-66506c1c"
    instance_type	= "t2.micro"
	depends_on = ["aws_instance.backend"]
	count = 2
	availability_zone	= "${var.us-east-zones[count.index]}"
	lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "backend" {
	provider = "aws.us-east-1"
	ami	= "ami-66506c1c"
	instance_type	= "t2.micro"
	count	= 2
	availability_zone	= "${var.us-east-zones[count.index]}"
	lifecycle{ 
		prevent_destroy = false
	}
}

resource "aws_instance" "frontend-west" {
    provider = "aws.us-west-zones"
    ami	= "ami-056ee704806822732"
    instance_type	= "t2.micro"
	count = 2
	availability_zone	= "${var.us-east-zones[count.index]}"
	lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "backend-west" {
	provider = "aws.us-west-zones"
	ami	= "ami-056ee704806822732"
	instance_type	= "t2.micro"
	count	= 2
	availability_zone	= "${var.us-east-zones[count.index]}"
	lifecycle{ 
		prevent_destroy = false
	}
}
output "frontend_ip" {
  value = "${aws_instance.frontend.public_ip}"
}

output "backend_ips" {
  value = "${aws_instance.backend.*.public_ip}"
}