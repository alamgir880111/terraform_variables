terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.70.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "example" {
  ami           = "ami-021aaf3749be66813"
  instance_type = var.aws_instance_type

# root_block_device {
#  delete_on_termination = true
#  volume_size = var.root_volume_size
#  volume_type = var.root_volume_type
# }

root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_volume_config.size
    volume_type           = var.ec2_volume_config.type
  }

  # tags = {
  #   Name = "tf-ec2-variable"
  # }

  tags = merge(
    {
      Name = "tf-ec2-variable"
    },
    var.additional_tags
  )
}
