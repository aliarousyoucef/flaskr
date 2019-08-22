output "ec2_global_ips" {
  description=""
  value = ["${aws_instance.webserver.*.public_ip}"]
}
