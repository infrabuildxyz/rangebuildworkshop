variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type = string
}

variable "vsphere_server" {
  type = string
}

variable "datacenter" {
  type    = string
  default = "Datacenter"
}

variable "datastore" {
  type = string
}

variable "resource_pool" {
  type = string
}

variable "host" {
  type = string
}

variable "template" {
  type = string
}

variable "virtual_switch" {
  type = string
}

variable "port_group" {
  type = string
}

variable "tag_category" {
  type = string
}

variable "tag" {
  type = string
}

variable "folder" {
  type = string
}

variable "templates" {
  type = list(any)
}

variable "networks" {
  type = list(any)
}

variable "vms" {
  type = map(
    object({
      name      = string
      customize = bool
      template  = string
      num_cpus  = string
      memory    = string
      network = map(
        object({
          network_id   = string
          ipv4_address = string
          netmask      = string
          mac_address  = string
        })
      )
      gateway         = string
      dns_server_list = list(string)
      domain_suffix   = string
      extra_config    = list(string)
    })
  )
}
