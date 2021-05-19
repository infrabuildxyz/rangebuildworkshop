tag            = "infrabuild"
tag_category   = "infrabuild.xyz"
datacenter     = "Datacenter"
resource_pool  = "esxi.infrabuild.xyz/Resources"
template       = "centos7"
datastore      = "Datastore"
host           = "esxi.infrabuild.xyz"
virtual_switch = "DISCONNECTED"
port_group     = "Default"
folder         = "/"
templates      = ["vyos", "centos7"]
networks       = ["Default", "VM Network"]
vms = {
  jumpbox = {
    name      = "jumpbox"
    customize = true
    template  = "centos7"
    num_cpus  = 2
    memory    = 4096
    network = {
      Default = {
        network_id   = "Default"
        ipv4_address = "10.10.10.150"
        netmask      = "24"
        mac_address  = "00:50:56:AA:BB:C0"
      }
      Internet = {
        network_id   = "VM Network"
        ipv4_address = "147.75.61.133"
        netmask      = "29"
        mac_address  = "00:50:56:AA:DD:BB"
      }
    }
    gateway         = "147.75.61.129"
    dns_server_list = ["8.8.8.8"]
    domain_suffix   = "frostbytes.io"
    extra_config = [
      "#!/bin/bash"
    ]
  },
  testvm1 = {
    name      = "testvm1"
    customize = true
    template  = "centos7"
    num_cpus  = 2
    memory    = 4096
    network = {
      Default = {
        network_id   = "Default"
        ipv4_address = "10.10.10.151"
        netmask      = "24"
        mac_address  = "00:50:56:AA:BB:D1"
      }
    }
    gateway         = "10.10.10.254"
    domain_suffix   = "frostbytes.io"
    dns_server_list = ["10.10.10.254"]
    extra_config = [
      "#!/bin/bash"
    ]
  },
  testvm2 = {
    name      = "testvm2"
    customize = true
    template  = "centos7"
    num_cpus  = 2
    memory    = 4096
    network = {
      Default = {
        network_id   = "Default"
        ipv4_address = "10.10.10.152"
        netmask      = "24"
        mac_address  = "00:50:56:AA:BB:D2"
      }
    }
    gateway         = "10.10.10.254"
    dns_server_list = ["10.10.10.254"]
    domain_suffix   = "frostbytes.io"
    extra_config = [
      "#!/bin/bash"
    ]
  },
  testvm3 = {
    name      = "testvm3"
    customize = true
    template  = "centos7"
    num_cpus  = 2
    memory    = 4096
    network = {
      Default = {
        network_id   = "Default"
        ipv4_address = "10.10.10.153"
        netmask      = "24"
        mac_address  = "00:50:56:AA:BB:D3"
      }
    }
    gateway         = "10.10.10.254"
    dns_server_list = ["10.10.10.254"]
    domain_suffix   = "frostbytes.io"
    extra_config = [
      "#!/bin/bash"
    ]
  },
  testvm4 = {
    name      = "testvm4"
    customize = true
    template  = "centos7"
    num_cpus  = 2
    memory    = 4096
    network = {
      Default = {
        network_id   = "Default"
        ipv4_address = "10.10.10.154"
        netmask      = "24"
        mac_address  = "00:50:56:AA:BB:D4"
      }
    }
    gateway         = "10.10.10.254"
    dns_server_list = ["10.10.10.254"]
    domain_suffix   = "frostbytes.io"
    extra_config = [
      "#!/bin/bash"
    ]
  },
  testvm11 = {
    name      = "testvm11"
    customize = true
    template  = "centos7"
    num_cpus  = 2
    memory    = 4096
    network = {
      Default = {
        network_id   = "Default"
        ipv4_address = "10.10.10.161"
        netmask      = "24"
        mac_address  = "00:50:56:13:37:11"
      }
    }
    gateway         = "10.10.10.254"
    dns_server_list = ["10.10.10.254"]
    domain_suffix   = "frostbytes.io"
    extra_config = [
      "#!/bin/bash"
    ]
  },
  vyos01 = {
    name      = "vyos01"
    customize = false
    template  = "vyos"
    num_cpus  = 2
    memory    = 4096
    network = {
      Default = {
        network_id   = "Default"
        ipv4_address = "10.10.10.9"
        netmask      = "24"
        mac_address  = "00:50:56:AA:BB:D9"
      }
    }
    gateway         = "10.10.10.254"
    dns_server_list = ["10.10.10.254"]
    domain_suffix   = "frostbytes.io"
    extra_config = [
      "#!/bin/bash",
      "set interfaces ethernet eth0 address 10.10.10.9/24",
      "set interfaces ethernet eth0 hw-id 00:50:56:AA:BB:D3",
      "set protocols static route 0.0.0.0/0 next-hop 10.10.10.254",
      "set system name-server 8.8.8.8"
    ]
  }
}
