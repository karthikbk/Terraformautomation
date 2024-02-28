variable "tags" {
  type = map(string)
  default = {
    source = "terraform"
  }
}
variable "azure_sqlserver_input" {

  type = map(object({   

    resource_group_name=string
    location=string
    sqlserver_name=string
    sqlversion=string
    administrator_login=string
    administrator_login_password=string    


  }))
}
variable "primary_blob_endpoint" {
  type=string
  
}
variable "primary_access_key" {
  type=string
  
}
  