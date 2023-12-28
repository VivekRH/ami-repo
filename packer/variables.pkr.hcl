variable "project_name" {

  description = "Name of the project"
  type = string

}

variable "project_env" {

  description = "Environment where project is run"
  type = string

}

variable "initial_packer_ami" {

  description = "AMI used for the instance that packer uses"
  type = string

}

locals {

  image-timestamp = "${formatdate("DD-MM-YYYY-hh-mm",timestamp())}" 
  image-name = "${var.project_name}-${var.project_env}-${local.image-timestamp}"
}

