output "app_server_0_ip" {

  value         = aws_instance.app_server[0].public_ip

}