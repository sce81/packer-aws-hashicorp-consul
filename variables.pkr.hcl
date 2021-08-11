variable "name"                 {
    type            = string
    default         = "Consul"
    description     = "name of compontent being built"
    sensitive       = false
}
variable "app_version"         {
    type            = string
    default         = "00"
    description     = "Version of App deployed"
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
    default         = "0000"
    description     = "Jenkins Build Number"
    sensitive       = false
}
variable "vpc_tagName" {
    default         = "0000"
    description     = "VPC Tag for Filtering"
    sensitive       = false
}
variable "subnet_tagEnvironment" {
    default         = "0000"
    description     = "Subnet Tag for Filtering"
    sensitive       = false
}
variable "subnet_tagName" {
    default         = "0000"
    description     = "Subnet Tag for Filtering"
    sensitive       = false
}
variable "sg_tagVPC" {
    default         = "0000"
    description     = "Security Group Tag for Filtering"
    sensitive       = false
}
variable "sg_tagGroup" {
    default         = "0000"
    description     = "Security Group Tag for Filtering"
    sensitive       = false
}
