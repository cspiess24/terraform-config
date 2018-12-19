variable "fortigate_version" {
  default = "fgt-5-4"
}

variable "aws_default_region" {
  default = "us-east-1"
}

variable "aws_account_id" { }

variable "incoming_fortigate_access" {
  default = ["0.0.0.0/0"]
}

variable "instance_type" {
  default = "m3.medium"
}

locals {
    fgtami = {
      fgt-5-4 = {
        us-east-1 = "ami-0a03ebcc154f32ad7"
        us-east-2 = "ami-081f7316632a9b6b1"
        us-west-1 = "ami-0bec6fc24ceccb6c6"
        us-west-2 = "ami-04527d39ad54bd684"
        ca-central-1 = "ami-043deb1eb4e2a5efc"
        eu-central-1 = "ami-09248e70e06507bba"
        eu-west-1 = "ami-08b55b20f96149cfe"
        eu-west-2 = "ami-097d7ae296fb7264e"
        eu-west-3 = "ami-02aa2fa314527782b"
        ap-southeast-1 = "ami-0a9942f63bb891b81"
        ap-southeast-2 = "ami-0dd1ebf465798b99b"
        ap-northeast-1 = "ami-0e85f488f8e5c59c1"
        ap-northeast-2 = "ami-09e1e63817347282d"
        ap-south-1 = "ami-0f324d2c2a526785f"
        sa-east-1 = "ami-0f4b275d58196977f"
      },
      fgt-5-6 = {
        us-east-1 = "ami-f460e28b"
        us-east-2 = "ami-c0300da5"
        us-west-1 = "ami-481b0528"
        us-west-2 = "ami-b97100c1"
        ca-central-1 = "ami-7888081c"
        eu-central-1 = "ami-cebb9925"
        eu-west-1 = "ami-ff3c0886"
        eu-west-2 = "ami-5965873e"
        eu-west-3 = "ami-8a9c2df7"
        ap-southeast-1 = "ami-7dcdf801"
        ap-southeast-2 = "ami-b504d3d7"
        ap-northeast-1 = "ami-a08961df"
        ap-northeast-2 = "ami-e10ba28f"
        ap-south-1 = "ami-64c0e30b"
        sa-east-1 = "ami-b091ccdc"
      },
      fgt-6-0 = {
        us-east-1 = "ami-09e4f25ec992c94ab"
        us-east-2 = "ami-0a1f403f5e0cfa88e"
        us-west-1 = "ami-057300bd7e60ea2b2"
        us-west-2 = "ami-0ea3f14da73832fdc"
        ca-central-1 = "ami-0583f62d15a462f5c"
        eu-central-1 = "ami-0af055c02be246473"
        eu-west-1 = "ami-0aeda1bdca1b205bd"
        eu-west-2 = "ami-0de7050ef166ab900"
        eu-west-3 = "ami-0ce86abfa74c76ad2"
        ap-southeast-1 = "ami-000c0166f49864e4a"
        ap-southeast-2 = "ami-0e3662b3f822e3be4"
        ap-northeast-1 = "ami-0bd9e6e0020928ef9"
        ap-northeast-2 = "ami-0a560b6c089c6310a"
        ap-south-1 = "ami-0c5a28e0b56028d6d"
        sa-east-1 = "ami-0424ffd602f0af643"
      }
    }

    fgt_ami_id = "${lookup(local.fgtami[var.fortigate_version], var.aws_default_region)}"
}
