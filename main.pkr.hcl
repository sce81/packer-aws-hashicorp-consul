source "amazon-ebs" "main" {
  profile         = "raxaws"
  ami_name        = "${var.name} ${local.timestamp}"
  ami_description = "${var.name}-${var.env}-${local.timestamp}"

  instance_type = var.instancetype
  region        = var.region
  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-2.0.20210326.0-x86_64-gp2"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["137112412989"]
  }
  ssh_username  = "ec2-user"
  ssh_interface = "private_ip"



  vpc_id        = "vpc-046340e71f03ad85e"
  subnet_id     = "subnet-0b569d5cb05c972e2"

  security_group_filter {
      filters = {
          "vpc-id": "vpc-046340e71f03ad85e"
          "group-id": "sg-07d5022d92074a96a",
      }
  }
}



build {
    sources = ["source.amazon-ebs.main"]

  provisioner "shell" {
    inline = ["sudo yum update -y"]
  }
  provisioner "shell" {
    inline = [
        "sudo yum install -y yum-utils",
        "wget https://releases.hashicorp.com/consul/1.9.5/consul_1.9.5_linux_amd64.zip",
        "unzip consul_1.9.5_linux_amd64.zip",
        "sudo mv consul /usr/local/bin/"
    ]
  }
}