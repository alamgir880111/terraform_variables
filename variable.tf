variable "aws_instance_type" {
    description = "The AWS instance type to use for the EC2 instance"
    validation {
        condition     = contains(["t2.micro", "t2.small", "t3.micro", "t3.small"], var.aws_instance_type)
        error_message = "Invalid instance type. Allowed values are: t2.micro, t2.small, t3.micro, t3.small."
    }
  
}

# variable root_volume_size {
#     description = "The size of the root volume in GB"
#     type        = number
#     default     = 20
# }

# variable root_volume_type {
#     description = "The type of the root volume"
#     type        = string
#     default     = "gp3"
# }

variable ec2_volume_config {
    description = "The configuration for the EC2 instance's root volume"
    type = object({
        size = number
        type = string
    })
    default = {
        size = 20
        type = "gp3"
    }
}

variable additional_tags {
    description = "Additional tags to apply to the EC2 instance"
    type        = map(string)
    default     = {}
}