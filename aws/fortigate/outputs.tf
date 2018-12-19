output "external_access" {
    value = "${aws_eip.fortigate_eip.public_ip}"
}

output "username" {
    value = "admin"
}

output "password" {
    value = "${aws_instance.fortigate.id}"
}