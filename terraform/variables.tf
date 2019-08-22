
variable "region" {
  default = "eu-west-1"
}

variable "ami" {
  default = "ami-08660f1c6fb6b01e7" #ubutnu 16.04 LTS 64
   #ami           = "ami-08935252a36e25f85" # Centos
}
variable "instance_type" {
  default="t2.micro"
}

variable "instance_count" {
  default="1"
}

variable "key_name" {
  default="ozva"
}