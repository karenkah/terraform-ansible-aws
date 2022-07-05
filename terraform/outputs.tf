output "instance_ip_ansible" {
  description = "Ansible ip"
  value       = aws_instance.ansible.public_ip
}

output "instance_ip_ubuntu" {
  description = "Ubuntu ip"
  value       = aws_instance.project_ubuntu.public_ip
}

output "instancia_ip_windows" {
  description = "Windows ip"
  value = aws_instance.project_windows.public_ip
}
