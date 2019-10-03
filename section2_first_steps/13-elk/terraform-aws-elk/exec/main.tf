module "elk" {
  source = "/root/terraform-aws-elk"

  key = "newtest"
  private_key = "${file("/tmp/newtest.pem")}"
}
