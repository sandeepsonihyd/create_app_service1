variable "resource_group_name" {
    type = string
    nullable = false
    default = "Terraform-rg"
}

variable "resource_group_location" {
    type = string
    default = "eastus" 
}
