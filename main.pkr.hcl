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
      architecture        = "x86_64"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["137112412989"]
  }
  ssh_username  = "ec2-user"
  ssh_interface = "private_ip"
  ebs_optimized = true



  vpc_filter {
      filters = {
          "tag:Name": "sandbox1-main-vpc"
      }
  }

  subnet_filter {
    random = true
    filters = {
        "tag:Environment": "sandbox1",
        "tag:Name": "sandbox1-core-*"
    }
  }  

  security_group_filter {
      filters = {
          "vpc-id": "vpc-046340e71f03ad85e"
          "group-id": "sg-07d5022d92074a96a",
      }
  }

    tags = {
        Name              = "${var.ami_name}-${formatdate("YYYYMMDDhhmmss", timestamp())}"
        BuiltBy           = "Packer"
        App               = var.name
        Environment       = var.env
        ManagedBy         = "Rackspace"
        JenkinsBuildID    = var.jenkins_build_id
    }


}



build {
    sources = ["source.amazon-ebs.main"]

  provisioner "shell" {
    inline = [
              "sleep 2",
              "sudo yum update -y"
    ]
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