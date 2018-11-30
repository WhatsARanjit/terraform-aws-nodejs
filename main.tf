terraform {
  required_version = ">= 0.11.0"
}

provider "aws" {
  region = "${var.aws_region}"
}

module "consumer_config" {
  source     = "./modules/templates/consumer"
  vault_addr = "${var.vault_ip}"
}

resource "aws_instance" "ubuntu" {
  ami                    = "${var.ami_id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.ssh_key_name}"
  vpc_security_group_ids = ["${var.security_group_id}"]
  user_data              = "${module.consumer_config.user_data}"
  iam_instance_profile   = "${var.iam_role}"

  tags {
    Name  = "${var.prefix}-nodejs-app"
    Owner = "${var.owner_tag}"
    TTL   = "${var.ttl_tag}"
  }
}

output "consumer ip" {
  value = "${aws_instance.ubuntu.public_ip}"
}
