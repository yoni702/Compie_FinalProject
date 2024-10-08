variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "eu-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-2 = "ami-00399ec92321828f5"
    us-east-1 = "ami-09e67e426f25ce0d7"
    eu-west-1 = "ami-0a8e758f5e873d1c1"
  }
}


variable "PATH_TO_PRIVATE_KEY" {
  default = "../002_mykey/mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "../002_mykey/mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
