# IP on the main screen!
output "final_api_url" {
  value       = "http://${module.my_compute.api_public_ip}:3111"
  description = "This is the link to test your AI!"
}
