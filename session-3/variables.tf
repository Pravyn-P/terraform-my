variable "cidr" {  # this is declaring name
    type = string  # this is declaring type
    #defualt = "10.0.0.0/16" # if we don't provide this default, then terraform will ask at run time
}
variable "public_subnet_cidr" {
    type = string
} 
variable "private_subnet_cidr" {
    type = string
}
variable "tags" {
    type = map
}
variable "internet_cidr" {
    type = string
}