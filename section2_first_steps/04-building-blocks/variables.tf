variable "ami_type" {
  default = {
    type      = "map"
    us-east-1 = "ami-0b69ea66ff7391e80"
    us-east-2 = "ami-00c03f7f7f2ec15c3"
  }
}
variable "env" {}
variable "region" {
    default = "us-east-1"
}
variable "instance_type" {
  type = "map"
  default = {
    dev  = "t2.micro"
    test = "t2.medium"
  }
}
variable "sgs" {
  type = "list"
  default = ["sg-9d2259c3", "sg-b56ca0d7"]
}