variable "name"                 {
    type            = string
    default         = "consul"
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
    description     = "environment name"
    sensitive       = false
}
variable "jenkins_build_id" {
    default         = "00"
    description     = "Jenkins Build Number"
    sensitive       = false
}