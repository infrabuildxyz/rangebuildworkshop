datacenter     = "Datacenter"
resource_pool  = "esxi.infrabuild.xyz/Resources"
template       = "centos7"
datastore      = "Datastore"
host           = "esxi.infrabuild.xyz"
virtual_switch = "DISCONNECTED"
port_group     = "Default"
folder         = "/"
templates      = ["vyos", "centos7"]
vms = {
  testvm1 = {
    name          = "testvm1"
    customize     = true
    template      = "centos7"
    num_cpus      = 2
    memory        = 4096
    ipv4_address  = "192.168.173.151"
    netmask       = "24"
    gateway       = "192.168.173.254"
    domain_suffix = "frostbytes.io"
    mac_address   = "00:50:56:AA:BB:D1"
    extra_config = [
      "#!/bin/bash"
    ]
  },
  testvm2 = {
    name          = "testvm2"
    customize     = true
    template      = "centos7"
    num_cpus      = 2
    memory        = 4096
    ipv4_address  = "192.168.173.152"
    netmask       = "24"
    gateway       = "192.168.173.254"
    domain_suffix = "frostbytes.io"
    mac_address   = "00:50:56:AA:BB:D2"
    extra_config = [
      "#!/bin/bash"
    ]
  },
  testvm3 = {
    name          = "testvm3"
    customize     = true
    template      = "centos7"
    num_cpus      = 2
    memory        = 4096
    ipv4_address  = "192.168.173.153"
    netmask       = "24"
    gateway       = "192.168.173.254"
    domain_suffix = "frostbytes.io"
    mac_address   = "00:50:56:AA:BB:D3"
    extra_config = [
      "#!/bin/bash"
    ]
  },
  vyos01 = {
    name          = "vyos01"
    customize     = false
    template      = "vyos"
    num_cpus      = 2
    memory        = 4096
    ipv4_address  = "192.168.173.9"
    netmask       = "24"
    gateway       = "192.168.173.254"
    domain_suffix = "frostbytes.io"
    mac_address   = "00:50:56:AA:BB:D9"
    extra_config = [
      "#!/bin/bash",
      "set interfaces ethernet eth0 address 192.168.173.9/24",
      "set interfaces ethernet eth0 hw-id 00:50:56:AA:BB:D3",
      "set protocols static route 0.0.0.0/0 next-hop 192.168.173.254",
      "set system name-server 8.8.8.8"
    ]
  }
}
