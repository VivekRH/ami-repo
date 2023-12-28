packer {

  required_plugins {
    amazon = {
      source = "github.com/hashicorp/amazon"
      version = "~> 1"
}

}

}

source "amazon-ebs" "packerami" {

  ami_name = local.image-name
  source_ami = var.initial_packer_ami
  instance_type = "t2.micro"
  ssh_username = "ec2-user"
  tags = {
    Name = local.image-name
    Project = var.project_name
    Environment = var.project_env

}

}

build {

  sources = ["source.amazon-ebs.packerami"]
  
  provisioner "file" {
    source = "../webapp"
    destination = "/tmp"

}

  provisioner "shell" {

    script = "./setup.sh"
    execute_command = "sudo {{.Path}}" 
} 

}

