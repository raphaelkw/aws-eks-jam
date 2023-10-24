# Declare the variables
variable "cluster_name" {
    default = "eks-jam-challenge-1"
    type = string 
}

variable "cluster_version" {
    default = "1.24"
    type = string
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
    type = string
}

variable "vpc_name" {
    default = "eks-jam-challenge-1-vpc"
    type = string
}