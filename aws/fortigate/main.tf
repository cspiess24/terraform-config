provider "aws" {
  region     = "${var.aws_default_region}"
  allowed_account_ids = ["${var.aws_account_id}"]

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/account-admin-iam-role"
  }
}

resource "random_uuid" "name" { }

resource "aws_eip" "fortigate_eip" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  allocation_id = "${aws_eip.fortigate_eip.id}"
  network_interface_id = "${aws_network_interface.fgt_external.id}"
}

resource "aws_network_interface" "fgt_external" {
  subnet_id = "${module.vpc.public_subnets[0]}"
  security_groups = ["${aws_security_group.FortigateSecurityGroup.id}"]

  tags {
    Name      = "Fortigate external interface ${random_uuid.name.result}"
    Createdby = "Terraform"
  }
}

resource "aws_network_interface" "fgt_internal" {
  subnet_id = "${module.vpc.intra_subnets[0]}"

  security_groups = ["${aws_security_group.FortigateSecurityGroup.id}"]

  tags {
    Name      = "Fortigate internal interface ${random_uuid.name.result}"
    Createdby = "Terraform"
  }
}

resource "aws_instance" "fortigate" {
  ami                  = "${local.fgt_ami_id}"
  instance_type        = "${var.instance_type}"

  network_interface {
    network_interface_id = "${aws_network_interface.fgt_external.id}"
    device_index         = 0
  }
  network_interface {
    network_interface_id = "${aws_network_interface.fgt_internal.id}"
    device_index         = 1
  }

  tags {
    Name        = "Fortigate-${random_uuid.name.result}"
    Terraform   = "true"
    Environment = "test"
  }
}
