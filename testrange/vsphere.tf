provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "host" {
  name          = var.host
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  for_each      = toset(var.templates)
  name          = each.value
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_distributed_virtual_switch" "switch" {
  name          = var.virtual_switch
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_tag_category" "tag_category" {
  name        = var.tag_category
  description = "Namespace specific tags"
  cardinality = "MULTIPLE"

  associable_types = [
    "VirtualMachine"
  ]
}

resource "vsphere_tag" "tag" {
  name        = var.tag
  category_id = vsphere_tag_category.tag_category.id
}

data "vsphere_network" "network" {
  name          = var.port_group
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "linux" {
  for_each         = var.vms
  name             = each.value.name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  host_system_id   = data.vsphere_host.host.id

  num_cpus = each.value.num_cpus
  memory   = each.value.memory
  guest_id = data.vsphere_virtual_machine.template[each.value.template].guest_id

  scsi_type = data.vsphere_virtual_machine.template[each.value.template].scsi_type

  tags = [vsphere_tag.tag.id]

  folder = var.folder

  network_interface {
    network_id     = data.vsphere_network.network.id
    adapter_type   = "vmxnet3"
    use_static_mac = true
    mac_address    = each.value.mac_address
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template[each.value.template].disks[0].size
    eagerly_scrub    = data.vsphere_virtual_machine.template[each.value.template].disks[0].eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template[each.value.template].disks[0].thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template[each.value.template].id

    dynamic "customize" {
      for_each = each.value.customize ? [1] : []
      content {
        linux_options {
          host_name = each.value.name
          domain    = each.value.domain_suffix
        }

        network_interface {
          ipv4_address = each.value.ipv4_address
          ipv4_netmask = each.value.netmask
        }

        ipv4_gateway = each.value.gateway
      }
    }
  }

  extra_config = {
    "guestinfo.config.boot" = base64encode(join("\n", each.value.extra_config))
  }
}
