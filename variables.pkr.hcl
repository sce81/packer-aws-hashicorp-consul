variable "name"                 {
    type            = string
    default         = "packer"
    description     = "name of compontent being built"
    sensitive       = false
}
variable "instancetype"         {
    type            = string
    default         = "t3.medium"
    description     = "size of provisioner"
    sensitive       = false
}
variable "region"               {
    type            = string
    default         = "eu-west-1"
    description     = "region to build in"
    sensitive       = false
}
variable "env"               {
    type            = string
    default         = "dev"
    description     = "environment name for tagging purposes"
    sensitive       = false
}
