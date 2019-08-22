resource "aws_instance" "webserver" {
  count=var.instance_count 
  ami           = var.ami 
  instance_type = var.instance_type
  tags = {
  Name = "flaskr.botify.com",
  env="test",
  server="web"
  }
  key_name=var.key_name
  security_groups = ["${aws_security_group.allow_all.name}"]  # work with default VPC
}
