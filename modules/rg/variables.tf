variable "global_config" {
  description = "The global cnfiguration settings"
  type        = any
  /*
  type = object({
    tags = object({
      "Accolade Project" = string // Enforced by Azure Policy
      Application        = string // Enforced by Azure Policy
      "Resource Owner"   = string // Enforced by Azure Policy
      deployed_by        = string
    })
  })
  */
}

variable "stack_config" {
  description = "stack configuration:  prefix and environment"
  type        = any
  /*
  type          = object({
    location    = string      // The cloud region in which all resources in this example should be provisioned.
                              // Should match resource group location if rg_name is set.
    prefix      = string      // The prefix used for namimiong convention.
    environment = string      // Label the deployment with the environment tag.
    tags        = map(string) // The global tags to be always present for the stack
  })
  */
}

variable "rg" {
  description = "resource group object name and tags"
  type = object({
    name = string
    tags = map(string)
  })
  default = {
    name = "default"
    tags = {}
  }
}

