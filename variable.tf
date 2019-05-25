variable "accesskey" {
  type = "string"
}
variable "secretkey" {
   type = "string"
}
variable "ami" {
   type = "string"
  default = "ami-0653e888ec96eab9b"
}
variable "region" {
  type = "string"
  default="us-east-2"
}
variable "instance_type" {
  type = "string"
  default="t2.micro"
}

