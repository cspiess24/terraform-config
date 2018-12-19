resource "aws_security_group" "FortigateSecurityGroup" {
  name        = "FortigateSecurityGroup-${random_uuid.name.result}"
  description = "Fortigate - Security Group"
  vpc_id      = "${module.vpc.vpc_id}"

  tags {
    Name      = "FortigateSecurityGroup"
    Createdby = "Terraform"
  }
}

resource "aws_security_group_rule" "ingress_rule" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = "${var.incoming_fortigate_access}"
  security_group_id = "${aws_security_group.FortigateSecurityGroup.id}"
}

resource "aws_security_group_rule" "egress_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.FortigateSecurityGroup.id}"
}
