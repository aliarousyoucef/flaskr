
resource "aws_security_group" "allow_all" {

  description = "Allow TCP 8080 and SSH only in ingress , all trafic allowed for egress  "
  
  name        = "flaskr.botify.com"

  
  
  #vpc_id="vpc-0b11b16bf44636f4c"
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

   ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
    egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

